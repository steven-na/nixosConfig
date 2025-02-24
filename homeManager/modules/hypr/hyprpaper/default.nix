{ pkgs, config, ... }:
let
  wallpaper1 = "/home/blakec/Downloads/32.png";
in
{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ wallpaper1 ];

      wallpaper = [
        "eDP-2,${wallpaper1}"
      ];
    };
  };
}
