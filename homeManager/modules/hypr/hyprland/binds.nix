{ ... }:
{
    wayland.windowManager.hyprland.extraConfig = # hyprlang
        ''
            $mainMod = SUPER

            bind = $mainMod, C, killactive, # close window
            bind = $mainMod, J, togglesplit, # dwindle
            bind = $mainMod, V, togglefloating,
            # bind = $mainMod, P, pseudo, # dwindle
            bind = $mainMod, F, fullscreen, 1
            bind = $mainMod CTRL, F, fullscreen, 0


            # Exec Binds
            bind = $mainMod, Q, exec, ghostty # terminal
            bind = $mainMod, R, exec, rofi -show drun # application starter
            bind = $mainMod SHIFT, F, exec, zen
            # Screen shot area
            bind = $mainMod SHIFT, P, exec, grimblast --notify --cursor --freeze --wait 2 --scale 1 copy area

            # Move focus with mainMod + arrow keys
            bind = $mainMod, left, movefocus, l
            bind = $mainMod, right, movefocus, r
            bind = $mainMod, up, movefocus, u
            bind = $mainMod, down, movefocus, d

            bind = $mainMod, h, movefocus, l
            bind = $mainMod, l, movefocus, r
            bind = $mainMod, k, movefocus, u
            bind = $mainMod, j, movefocus, d

            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = $mainMod, mouse:272, movewindow
            bindm = $mainMod, mouse:273, resizewindow

            # Switch Special workspaces
            bind = $mainMod, S, togglespecialworkspace, magic
            bind = $mainMod SHIFT, S, movetoworkspace, special:magic

            bind = SUPER, D, exec, pgrep electron && hyprctl dispatch togglespecialworkspace vesktop || electron &
            bind = SUPER, P, exec, hyprctl dispatch togglespecialworkspace spotify
            bind = SUPER, O, exec, hyprctl dispatch togglespecialworkspace obsidian

            # Switch workspaces with mainMod + [0-9]
            bind = $mainMod, 1, workspace, 1
            bind = $mainMod, 2, workspace, 2
            bind = $mainMod, 3, workspace, 3
            bind = $mainMod, 4, workspace, 4
            bind = $mainMod, 5, workspace, 5
            bind = $mainMod, 6, workspace, 6
            bind = $mainMod, 7, workspace, 7
            bind = $mainMod, 8, workspace, 8
            bind = $mainMod, 9, workspace, 9
            bind = $mainMod, 0, workspace, 10

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
            bind = $mainMod SHIFT, 1, movetoworkspace, 1
            bind = $mainMod SHIFT, 2, movetoworkspace, 2
            bind = $mainMod SHIFT, 3, movetoworkspace, 3
            bind = $mainMod SHIFT, 4, movetoworkspace, 4
            bind = $mainMod SHIFT, 5, movetoworkspace, 5
            bind = $mainMod SHIFT, 6, movetoworkspace, 6
            bind = $mainMod SHIFT, 7, movetoworkspace, 7
            bind = $mainMod SHIFT, 8, movetoworkspace, 8
            bind = $mainMod SHIFT, 9, movetoworkspace, 9
            bind = $mainMod SHIFT, 0, movetoworkspace, 10
        '';
}
