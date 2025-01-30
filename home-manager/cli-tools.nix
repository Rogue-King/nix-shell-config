{ config, pkgs, lib, ... }:

{ 
  home.packages = with pkgs; [  
    #cli tools
    bat
    btop
    curl
    docker
    dust
    ghostty
    git
    neovim
    nettools
    nix-prefetch-github
    nmap
    openssh
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
    #thefuck.enable = true;
    #thefuck.enableZshIntegration = true;
    
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
        fu = "fuck";
        lt = "eza --tree";
      	cd = "z";
        cat = "bat";
        catp = "bat -p";
        btop = "btop --utf-force";
        open = "xdg-open";
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
        #plugins = ["thefuck"];
      };
    };

    starship = {
      settings = {
      add_newline = true;
      format = lib.concatStrings [
      	"$time"
      	"$directory"
      	"$git_branch"
      	"$git_status"
      	"$hostname"
      	"$golang"
      	"direnv"
      	"$status"
      ];

      right_format = lib.concatStrings [
      	"$cmd_duration"
      ];

      cmd_duration = {
      	disabled = false;
      	show_notifications = false;
      	min_time = 2000;
      	format = "[$duration](bold yellow)";
      };

      directory = {
        style = "cyan";
      	format = ''\[[$path]($style)\] '';
      };

      direnv = {
      	disabled = false;
      };

      git_branch = {
      	style = "bold cyan";
      	format = ''\[[$symbol$branch(:$remote_branch)]($style)\] '';
      };
	
      git_status = {
      	format = "[($all_status$ahead_behind )]($style)";
      	conflicted = "🏳";
      	ahead = "⇡\${count}";
      	diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
      	behind = "⇣\${count}";
      	up_to_date = "✓";
      	untracked = "🤷";
      	stashed = "📦";
      	modified = "📝";
        staged = ''[++\($count\)](green)'';
      	renamed = "👅";
      	deleted = "🗑";
      };

      golang = {
      	format = ''\[[$symbol($version)]($style)\]'';
      };

      hostname = {
      	format = "[$ssh_symbol$hostname]($style) ";
      };

      status = {
      	disabled = false;
      	success_symbol = "[❱](bold red)[❱](bold yellow)[❱](bold green) ";
      	symbol = "[❱❱❱](bold red) ";
      	format = "$symbol";
      };

      time = {
        disabled = false;
      	style = "cyan";
      	format = ''\[[$time]($style)\] '';
      };

     };
    };
  };
}
