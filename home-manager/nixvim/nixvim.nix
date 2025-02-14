{
  programs = {
    nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      #colorschemes.onedark.enable = true;

      colorschemes.everforest = {
        enable = true;
        settings = {
          background = "hard";
          transparent_background = 1;  
        };
      };

      opts = {
        number = true;
        relativenumber = true;
        expandtab = true;
        shiftwidth = 2;
        tabstop = 2;
      };

      diagnostics = {
        virtual_text = true;
        update_in_insert = true;
        severity_sort = true;
      };

      globals = {
        mapleader = " ";
        maplocalleader = " ";
      };

      keymaps = [
        {
          action = ":q<CR>";
          key = "<leader>q";
          options = {
            silent = true;
            noremap = true;
            desc = "Quit";
          };
        }
        {
          action = ":w<CR>";
          key = "<leader>w";
          options = {
            silent = true;
            noremap = true;
            desc = "Save";
          };
        }
        {
          action = ":wq<CR>";
          key = "<leader>wq";
          options = {
            silent = true;
            noremap = true;
            desc = "Save and quit";
          };
        }
        {
          action = "<C-\\><C-n>:ToggleTerm direction=float<CR>";
          key = "<leader>t";
          mode = [ "n" "v" "t" ];
          options = {
            silent = true;
            noremap = true;
            desc = "Toggle floating terminal";
          };
        }
        {
          action = ":Telescope live_grep<CR>";
          key = "<leader>lg";
          options = {
            silent = true;
            noremap = true;
            desc = "Live grep";
          };
        }
        {
          action = ":Telescope find_files<CR>";
          key = "<leader>ff";
          options = {
            silent = true;
            noremap = true;
            desc = "Find file";
          };
        }
        {
          action = ":Telescope oldfiles<CR>";
          key = "<leader>of";
          options = {
            silent = true;
            noremap = true;
            desc = "Browse recent files";
          };
        }
        {
          action = ":Telescope file_browser<CR>";
          key = "<leader>fb";
          options = {
            silent = true;
            noremap = true;
            desc = "Directory-based file browser";
          };
        }
        {
          action = ":Neotree toggle reveal<CR>";
          key = "<leader>nt";
          options = {
            silent = true;
            noremap = true;
            desc = "Toggle file tree";
          };
        }
      ];

      plugins = {
        comment.enable = true;
        direnv.enable = true;
        gitsigns.enable = true;
        intellitab.enable = true;
        lastplace.enable = true;
        lsp-format.enable = true;
        lspsaga.enable = true;
        lualine.enable = true;
        luasnip.enable = true;
        multicursors.enable = true;
        neo-tree.enable = true;
        neoscroll.enable = true;
        nix.enable = true;
        nvim-autopairs.enable = true;
        nvim-colorizer.enable = true;
        refactoring.enable = true;
        toggleterm.enable = true;
        treesitter.enable = true;
        web-devicons.enable = true;

        telescope = {
          enable = true;
          extensions.file-browser.enable = true;
        };

        transparent = {
          enable = true;
          settings = {
            groups = [
              "Normal"
              "NormalNC"
              "Comment"
              "Constant"
              "Special"
              "Identifier"
              "Statement"
              "PreProc"
              "Type"
              "Underlined"
              "Todo"    
              "String"
              "Function"
              "Conditional"
              "Repeat"
              "Operator"  
              "Structure"
              "LineNr"
              "NonText"
              "SignColumn"
              "CursorLine"
              "CursorLineNr"
              "StatusLine"
              "StatusLineNC"
              "EndOfBuffer"
            ];

          };

        };

        lint = {
          enable = true;
          autoCmd = {
            event = [ "InsertLeave" "TextChanged" ];
          };
        };

        illuminate = {
          enable = true;
          delay = 100;
          minCountToHighlight = 1;
          modesAllowlist = ["n" "i" "v"];
        };

        ollama = {
          enable = true;
          #url = ;
        };

        which-key = {
          enable = true;
          settings = {
            preset = "modern";
            delay = 500;
            expand = 1;
            notify = false;
            win = {
              border = "single";
              padding = [1 1];
              wo.winblend = 10;
            };
            replace = {
              desc = [
                [
                  "<space>"
                  "SPACE"
                ]
                [
                  "<leader>"
                  "SPACE"
                ]
                [
                  "<[cC][rR]>"
                  "RETURN"
                ]
                [
                  "<[tT][aA][bB]>"
                  "TAB"
                ]
                [
                  "<[bB][sS]>"
                  "BACKSPACE"
                ]
              ];
            };
          };
        };

        scrollview = {
          enable = true;
          settings = {
            signs_on_startup = [
              "all"
            ];
          };
        };

        startup = {
          enable = true;
          parts = [ "header" "body" ];
          sections = {
            header = {
              align = "center";
              content = {
                __raw = "require('startup.headers').hydra_header";
              };
              defaultColor = "";
              foldSection = false;
              highlight = "Statement";
              margin = 5;
              oldfilesAmount = 0;
              title = "Header";
              type = "text";
            };
            body = {
              align = "center";
              content = [
                [
                  " Find File"
                  "Telescope find_files"
                  "<leader>ff"
                ]
                [
                  "󰍉 Find Word"
                  "Telescope live_grep"
                  "<leader>lg"
                ]
                [
                  " Recent Files"
                  "Telescope oldfiles"
                  "<leader>of"
                ]
                [
                  " File Browser"
                  "Telescope file_browser"
                  "<leader>fb"
                ]
                [
                  " New File"
                  "lua require'startup'.new_file()"
                  "<leader>nf"
                ]
              ];
              defaultColor = "";
              foldSection = false;
              highlight = "String";
              margin = 5;
              oldfilesAmount = 0;
              title = "Basic Commands";
              type = "mapping";
            };
          };
        };

        indent-blankline = {
          enable = true;
          settings = {
            scope = {
              show_end = true;
              show_exact_scope = true;
              show_start = true;
            };
          };
        };

        cmp = {
          enable = true;
          autoEnableSources = true;

          settings = {
            sources = [
              {name = "nvim_lsp";}
              {name = "path";}
              {name = "buffer";}
              {name = "luasnip";}
            ];
            mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<C-d>" = "cmp.mapping.scroll_docs(-4)";
              "<C-e>" = "cmp.mapping.close()";
              "<C-f>" = "cmp.mapping.scroll_docs(4)";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            };
          };
        };

        lsp = {
          enable = true;
          
          servers = {
            nixd = {
              enable = true;
              extraOptions = {
                offset_encoding = "utf-8";
              };
            };
            ts_ls.enable = true;
            gopls.enable = true;
            golangci_lint_ls.enable = true;
            rust_analyzer = {
              enable = true;
              installCargo = true;
              installRustc = true;
            };
          };
        };
      };
    };
  };
}
