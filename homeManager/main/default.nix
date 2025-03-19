{
    inputs,
    pkgs,
    ...
}:
{
    imports = [
        inputs.nix-colors.homeManagerModules.default

        ../modules/terminals/ghostty
        ../modules/hypr
        ../modules/vencord
        ../modules/nvim
        ../modules/zen
        ../modules/spotify
        ../modules/cli
        ../modules/git
    ];

    colorScheme = inputs.nix-colors.colorSchemes.nord;

    nixpkgs = {
        config = {
            allowUnfree = true;
        };
    };

    home = {
        username = "blakec";
        homeDirectory = "/home/blakec";
        packages = [
            inputs.zen-browser.packages.x86_64-linux.default

            inputs.nixvim.packages.x86_64-linux.default

            (pkgs.nerdfonts.override {
                fonts = [
                    "JetBrainsMono"
                ];
            })
        ];
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.nordzy-cursor-theme;
            name = "Nordzy-cursors";
            size = 16;
        };
    };

    gtk = {
        enable = true;

        theme = {
            package = pkgs.nordic;
            name = "Nordic";
        };
        cursorTheme = {
            package = pkgs.nordzy-cursor-theme;
            name = "Nordzy-cursors";
            size = 16;
        };
    };

    programs = {
        home-manager.enable = true;
    };

    # Nicely reload system units when changing configs
    systemd.user.startServices = "sd-switch";

    # Fonts
    fonts.fontconfig.enable = true;

    home.stateVersion = "24.11";
}
