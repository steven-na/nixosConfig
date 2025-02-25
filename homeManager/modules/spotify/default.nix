{ inputs, config, pkgs, lib, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  # home.packages = with pkgs; [
  #   spotify
  # ];

  programs.spicetify =
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in
  {
    enable = true;

    enabledExtensions = with spicePkgs.extensions; [
      beautifulLyrics
      starRatings
      queueTime
      hidePodcasts
      shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    # enabledCustomApps = with spicePkgs.apps; [
    #   newReleases
    #   ncsVisualizer
    # ];
    enabledSnippets = with spicePkgs.snippets; [
      pointer
    ];

    theme = spicePkgs.themes.comfy;
    colorScheme = "nord";
  };
}
