{ config, pkgs, lib, ... }:
{
  # Use home.file to symlink Neovim configuration files
  home.file = {
    # Symlink the Neovim config directory
    ".config/vesktop/themes" = {
      source = ./themes;  # This points to the directory fetched from GitHub
    };
  };
}
