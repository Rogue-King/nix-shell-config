{
  programs = {
    fastfetch = {
      enable = true;
      settings = {
        logo = {
          source = "/etc/nixos/home-manager/fastfetch/assets/Jiji.jpg";
          type = "kitty";
          height = 20;
          width = 60;
          padding = {
            top = 2; #2;
            left = 2; # 3;
          };
        };
        display = {
          separator = " ➜  ";
        };
        modules = [
          "break"
          "break"
          {
            type = "os";
            key = " OS   ";
            keyColor = "31";
          }
          {
            type = "kernel";
            key = " ├   kernel";
            keyColor = "31";
          }
          {
            type = "packages";
            key = " ├ 󰏖  packages";
            keyColor = "31";
          }
          {
            type = "shell";
            key = " └   shell";
            keyColor = "31";
          }
          "break"
          {
            type = "wm";
            key = " WM   ";
            keyColor = "32";
          }
          {
            type = "wmtheme";
            key = " ├ 󰉼  theme";
            keyColor = "32";
          }
          {
            type = "icons";
            key = " ├ 󰀻  icons";
            keyColor = "32";
          }
          {
            type = "cursor";
            key = " ├   cursor";
            keyColor = "32";
          }
          {
            type = "terminal";
            key = " ├   terminal";
            keyColor = "32";
          }
          {
            type = "processes";
            key = " └   processes";
            keyColor = "32";
          }
          "break"
          {
            type = "host";
            format = "{5} {1} Type {2}";
            key = " PC   ";
            keyColor = "33";
          }
          {
            type = "cpu";
            format = "{1} ({3}) @ {7} GHz";
            key = " ├   cpu";
            keyColor = "33";
          }
          {
            type = "gpu";
            format = "{1} {2} @ {12} GHz";
            key = " ├ 󰢮  gpu";
            keyColor = "33";
          }
          {
            type = "memory";
            key = " ├   memory";
            keyColor = "33";
          }
          {
            type = "swap";
            key = " ├ 󰓡  swap";
            keyColor = "33";
          }
          {
            type = "disk";
            key = " ├ 󰋊  disk";
            keyColor = "33";
          }
          {
            type = "monitor";
            key = " ├   monitor";
            keyColor = "33";
          }
          {
            type = "battery";
            key = " ├ 󰂀  battery";
            keyColor = "33";
          }
          {
            type = "localip";
            key = " └ 󰩟  local ip";
            keyColor = "33";
          }
        ];
      };
    };
  };
}
