{ ... }:
{
    home.sessionVariables.TERMINAL = "ghostty";
    programs.ghostty = {
        enable = true;
        enableZshIntegration = true;
        installVimSyntax = true;
        # theme = "nord";
        settings = {
            background-opacity = 0.8;
            background = "#242933";
            gtk-titlebar = false;
            resize-overlay = "never";
            window-save-state = "always";
            keybind = "ctrl+enter=unbind";
        };
    };
}
