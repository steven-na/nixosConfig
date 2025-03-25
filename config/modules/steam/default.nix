{ pkgs, config, ... }:
{
    programs.steam = {
        enable = true;
        package = pkgs.steam.override {
    extraLibraries =
      pkgs:
      (
        with config.hardware.opengl;
        if pkgs.hostPlatform.is64bit then [ package ] ++ extraPackages else [ package32 ] ++ extraPackages32
      )
      ++ [ pkgs.libxcrypt ];
  };
    };
}
