{ pkgs, config, ... }:
{
  environment.systemPackages = with pkgs; [
    pciutils
    gcc
    lshw
    cmake
    wget
    htop
    fd
    imagemagick_light
    lazygit
    fastfetch
    git
    fzf
    unzip
    ripgrep
    cargo
    gowall

    starship
    grc
  ];
}
