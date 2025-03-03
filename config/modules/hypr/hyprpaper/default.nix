{ config, pkgs, ... }:
{
    # systemd.user.services."wallpaper-changer" = {
    #   description = "Restart hyprpaper when wallpaper changes";
    #   wantedBy = [ "multi-user.target" ];
    #   script =
    #   ''
    #     bash $HOME/.config/wallpaper/monitor_wallpaper.sh
    #   '';
    # };

    # systemd.services."wallpaper-changer" = {
    #   description = "Restart hyprpaper when wallpaper changes";
    #   script =
    #   ''
    #      export PATH=${pkgs.inotify-tools}/bin:${pkgs.bash}/bin:${pkgs.procps}/bin:${pkgs.hyprpaper}/bin:$PATH
    #      export HOME=${config.users.users.blakec.home}
    #      ${pkgs.bash}/bin/bash ${config.users.users.blakec.home}/.config/wallpaper/monitor_wallpaper.sh
    #   '';
    #   serviceConfig = {
    #     User = "blakec";
    #   };
    #   wantedBy = [ "multi-user.target" ];
    # };

    # systemd.services."wallpaper-changer" = {
    #   description = "Restart hyprpaper when wallpaper changes";
    #   wantedBy = [ "multi-user.target" ];
    #   serviceConfig.ExecStart = "${pkgs.bash}/bin/bash ${config.users.users.blakec.home}/.config/wallpaper/monitor_wallpaper.sh";
    #   serviceConfig.User = "blakec";
    #   serviceConfig.Group = config.users.users.blakec.group;
    #
    #   environment = {
    #     HOME = "${config.users.users.blakec.home}";
    #     PATH = "${pkgs.inotify-tools}/bin:${pkgs.bash}/bin:${pkgs.coreutils}/bin:${pkgs.util-linux}/bin:${pkgs.findutils}/bin:${pkgs.gnugrep}/bin";
    #   };
    # };
}
