{ config, pkgs, lib, ... }:

{ 
  home.packages = with pkgs; [  
    #cli tools
    bat
    btop
    curl
    docker
    dust
    file
    findutils
    ghostty
    git
    neovim
    nettools
    nix-prefetch-github
    nmap
    openssh
    plocate
    tailscale
    thefuck
    tldr
    unzip
    vim
    wget
  ];

  programs = {
    fastfetch.enable = true;  
    fzf.enable = true;
    bat.enable = true;
    btop.enable = true;
    kitty.enable = true;
    yazi.enable = true;
    starship.enable = true;
    lazygit.enable = true;
    thefuck.enable = true;
    thefuck.enableZshIntegration = true;
    
    git = {  
      enable = true;
      userName = "USER";
    };
    
    eza = {
      enable = true;
      icons = "auto";
      enableZshIntegration = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };

    ssh = {
     enable = true;
     matchBlocks = {
       global = {
         host = "*";
         setEnv = {
           TERM = "xterm-256color";
         };
        };
      };
     # Add IdentityAgent configuration here
     extraConfig = ''
        IdentityAgent ~/.1password/agent.sock
     '';
    };

    zoxide = {  
      enable = true;
      enableZshIntegration = true;
    };
    
    zsh = {        
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      historySubstringSearch.enable = true;

      shellAliases = {
        ls = "eza --color=auto";
        grep = "grep --color=auto";
        ll = "eza -la";
        lg = "lazygit";
        fu = "thefuck";
	fk = "thefuck";
	fuck = "thefuck";
        lt = "eza --tree";
      	cd = "z";
        cat = "bat";
        catp = "bat -p";
        btop = "btop --utf-force";
        open = "xdg-open";
	rebuild = "sudo home-manager switch";
      };

      initExtra = ''
        . ~/.nix-profile/etc/profile.d/nix.sh
        fastfetch
      '';

      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };

      oh-my-zsh = {
        enable = true;
      };
    };
  };
}
