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
  ];
}
