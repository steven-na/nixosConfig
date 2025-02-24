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
  ];
  home.packages = with pkgs; [
    grimblast # Screenshots
    kooha # for video
    wf-recorder # Screen recorder
    hyprpicker # Color picker
  ];
}
