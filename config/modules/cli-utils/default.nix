{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        pciutils
        gcc
        lshw
        cmake
        wget
        htop
        fd
        jq
        imagemagick_light
        lazygit
        fastfetch
        git
        fzf
        unzip
        ripgrep
        cargo
        gowall
        inotify-tools
        starship
        zoxide
        bat
        grc
        just
        nix-prefetch-git
    ];
}
