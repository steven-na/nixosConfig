{
    config,
    pkgs,
    lib,
    ...
}:

let
    # Path to your GitHub repository for zen theme
    zenConfigRepo = "https://github.com/steven-na/zen-browser-theming.git";

    # Fetch the GitHub repository (without needing access to /tmp)
    zenConfig = pkgs.fetchgit {
        url = zenConfigRepo;
        # rev = "main";  # or specify the commit/branch you want
        hash = "sha256-gMP0xT27VecEWcbkrs7XmgRNdzvRZmnTqFCNv+6dewM=";
    };
in
{
    # Use home.file to symlink zen files
    home.file = {
        # Symlink the zen directory
        ".zen/nqm46adw.default/chrome" = {
            source = "${zenConfig}/"; # This points to the directory fetched from GitHub
            recursive = true;
            force = true;
        };
    };
}
