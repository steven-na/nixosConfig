{
    inputs,
    pkgs,
    ...
}:

{
    imports = [
        ./fastfetch
        ./starship
        ./fish
        ./yazi
        ./tmux
    ];
}
