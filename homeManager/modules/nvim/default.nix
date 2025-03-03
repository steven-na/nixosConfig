{
    config,
    pkgs,
    lib,
    ...
}:

let
    # Path to your GitHub repository for Neovim config
    nvimConfigRepo = "https://github.com/steven-na/nvim-config.git";

    # Fetch the GitHub repository (without needing access to /tmp)
    nvimConfig = pkgs.fetchgit {
        url = nvimConfigRepo;
        rev = "d36b40d6e00434693ef5d83d54549381884241f8"; # or specify the commit/branch you want
        hash = "sha256-xd1z2itBXuoZMkFRd41f2K+1/TEdcEcVQI2ibIAF0hs=";
    };

in
{
    # Use home.file to symlink Neovim configuration files
    home.file = {
        # Symlink the Neovim config directory
        ".config/nvim" = {
            source = "${nvimConfig}/"; # This points to the directory fetched from GitHub
            recursive = true;
            force = true;
        };
    };
}
