{ pkgs, config, ... }:
let
    wallpaper1 = "${config.home.homeDirectory}/.config/wallpaper/converted/wallpaper.png";
in
{
    imports = [
        ./wallpaper-changer.nix
    ];

    services.hyprpaper = {
        enable = true;
        settings = {
            ipc = "on";
            splash = false;
            splash_offset = 2.0;

            preload = [ wallpaper1 ];

            wallpaper = [
                ",${wallpaper1}"
            ];
        };
    };
}
