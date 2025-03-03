# *.nix
{ inputs, ... }:
{
    imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];

    programs.hyprpanel = {
        enable = true;
        systemd.enable = true;
        hyprland.enable = true;
        overwrite.enable = true;
        theme = "nord";
        # override = {
        #   theme.bar.menus.text = "#123ABC";
        # };
        settings = {
            bar.launcher.autoDetectIcon = true;
            bar.workspaces.show_icons = true;

            menus.clock = {
                time = {
                    military = true;
                    hideSeconds = true;
                };
                weather.unit = "imperial";
            };

            menus.dashboard.directories.enabled = false;
            menus.dashboard.stats.enable_gpu = true;

            theme.bar.transparent = true;

            theme.font = {
                name = "JetBrainsMono Nerd Font";
                size = "13px";
            };
        };
    };
}
