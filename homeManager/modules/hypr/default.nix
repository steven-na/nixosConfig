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
    ./hyprpanel
  ];
  home.packages = with pkgs; [
    hyprpanel
    grimblast # Screenshots
    kooha # for video
    wf-recorder # Screen recorder
    hyprpicker # Color picker
  ];
}
