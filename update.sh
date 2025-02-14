#!/bin/bash

git pull

files=("home-manager/home.nix" "home-manager/cli-tools.nix")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        # Use sed to replace 'USER' with the replacement word
        sed -i "s/USER/$USER/g" $file
        echo "Processed: $file"
    else
        echo "Error: $file does not exist or is not a regular file."
    fi
done

cp -r home-manager/ ~/.config/

home-manager switch
