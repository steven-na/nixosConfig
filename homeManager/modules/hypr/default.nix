{
    pkgs,
    inputs,
    config,
    ...
}:
{
    imports = [
        ./hyprland
        ./hyprpaper
        ./waybar
        ./swaync
    ];
    home.packages = with pkgs; [
        grimblast # Screenshots
        kooha # for video
        wf-recorder # Screen recorder
        hyprpicker # Color picker
    ];
}
