{ ... }:
{
    wayland.windowManager.hyprland.extraConfig = # hyprlang
        ''
            # Bind D = Discord special
            windowrulev2 = tile,class:(vesktop)
            windowrulev2 = workspace special:vesktop silent,class:(vesktop)

            # Bind O = Obsidian special
            windowrulev2 = tile,class:(obsidian)
            windowrulev2 = workspace special:obsidian silent,class:(obsidian)

            # Bind P = Spotify special
            windowrulev2 = tile,class:(spotify)
            windowrulev2 = workspace special:spotify silent,class:(spotify)

            # Force floating window
            windowrulev2 = float, class:steam, initialTitle:Friends List
        '';
}
