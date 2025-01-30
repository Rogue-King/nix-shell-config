!#/bin/bash

echo "You are logged in as $USER"
read -p "Is this the target user? Y/N: " response

case "$response" in
    [Yy]* ) echo "Proceeding...";;
    [Nn]* ) echo "Exiting..."; exit 1;;
    * ) echo "Invalid input. Please enter Y or N."; exit 1;;
esac

echo "Intalling nix"
sh <(curl -L https://nixos.org/nix/install) --no-daemon

echo "Installing flakes"
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf

. ~/.nix-profile/etc/profile.d/nix.sh

echo "Installing home-manager"
nix-channel --add https://nixos.org/channels/nixos-24.11 nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

replacement_word="$USER"

files=("home.nix" "cli-tools.nix")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        # Use sed to replace 'USER' with the replacement word
        sed -i "s/USER/$replacement_word/g" "$file"
        echo "Processed: $file"
    else
        echo "Error: $file does not exist or is not a regular file."
    fi
done

nix-shell '<home-manager>' -A install

cp -r home-manager/ ~/.config/

home-manager switch

sudo echo "/home/$USER/.nix-profile/bin/zsh" | sudo tee -a /etc/shells

. ~/.nix-profile/etc/profile.d/nix.sh

chsh -s /home/$USER/.nix-profile/bin/zsh $USER

source ~/.zshrc
