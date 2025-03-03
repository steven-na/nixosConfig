{ pkgs, config, ... }:
{
    home.file.".config/wallpaper/change_existing.sh" = {
        source = ./scripts/change_existing.sh;
        force = true;
    };
    home.file.".config/wallpaper/monitor_wallpaper.sh" = {
        source = ./scripts/monitor_wallpaper.sh;
        force = true;
    };
}
