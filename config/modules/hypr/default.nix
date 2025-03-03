{ pkgs, ... }:
let
    unstableTarball = fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
        sha256 = "1blzcjd13srns4f5b4sl5ad2qqr8wh0p7pxbyl1c15lrsa075v8h";
    };

    unstablePkgs = import unstableTarball { system = pkgs.system; };
in
{
    nixpkgs.overlays = [
        (final: prev: {
            hyprland = unstablePkgs.hyprland;
        })
    ];
    imports = [
        # ./hyprpaper
    ];
    environment.systemPackages = with pkgs; [
        waybar
        (waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
        }))
        waybar-mpris
        hyprcursor
        swaynotificationcenter
        libnotify
        hyprpaper
        hyprland
        rofi-wayland
        wl-clipboard
    ];
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };

    services.xserver.enable = true;

    # Wayland
    environment.sessionVariables = {
        WLR_NO_HARDWARE_CURSORS = "1";
        NIXOS_OZONE_WL = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        NVD_BACKEND = "direct";
    };
}
