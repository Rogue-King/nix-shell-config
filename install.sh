!#/bin/bash
echo "Intalling nix and home-manager"

sh <(curl -L https://nixos.org/nix/install) --no-daemon

mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf

. ~/.nix-profile/etc/profile.d/nix.sh

nix-channel --add https://nixos.org/channels/nixos-24.11 nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

cp -r home-manager/ ~/.config/

home-manager switch

sudo echo "/home/$USER/.nix-profile/bin/zsh" | sudo tee -a /etc/shells

. ~/.nix-profile/etc/profile.d/nix.sh

chsh -s /home/$USER/.nix-profile/bin/zsh $USER

source ~/.zshrc

#sudo echo ". ~/.nix-profile/etc/profile.d/nix.sh" | sudo tee -a ~/.bashrc

#sudo echo "zsh" | sudo tee -a ~/.bashrc
