{ lib, ... }:

{
  programs = {
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

