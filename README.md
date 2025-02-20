## Install

```
git clone https://github.com/Rogue-King/nix-shell-config.git
cd nix-shell-config
bash install.sh
```
## Update

```
bash update.sh
```

## Updating Configurations

```home-manager switch```

or just use the alias:

```rebuild```

## Allowing Sudo to run commands

Edit the sudoers file in /etc, (must be root user or have sudo permissions to edit)
append the following to secure_path:

```:/home/yourusername/.nix-profile/bin:/nix/var/nix/profiles/default/bin```
