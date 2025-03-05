{ pkgs, config, ... }:
let
    wallpaper1 = "${config.home.homeDirectory}/.config/wallpaper/converted/wallpaper.png";
in
{
    imports = [
        ./wallpaper-changer.nix
    ];

    # systemd.user.services."wallpaper_changer" = {
    #   Unit = {
    #     Description = "Restart hyprpaper when changing wallpaper file";
    #     PartOf = [ "graphical-session.target" ];
    #     After = [ "graphical-session.target" ];
    #   };
    #   Service = {
    #     ExecStart = "${config.home.homeDirectory}/.config/wallpaper/monitor_wallpaper.nix";
    #     Restart = "on-failure";
    #   };
    #   Install = {
    #     WantedBy = [ "graphical-session.target" ];
    #   };
    # };
    #
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
