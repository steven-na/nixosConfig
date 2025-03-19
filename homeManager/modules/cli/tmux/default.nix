{
    pkgs,
    ...
}:
{
    programs.tmux = {
        enable = true;
        mouse = true;
        disableConfirmationPrompt = true;
        keyMode = "vi";
        plugins = with pkgs.tmuxPlugins; [
            nord
            tmux-fzf
            yank
            weather
            vim-tmux-navigator
            
        ];
        extraConfig = #bash
        ''
            unbind C-b
            set-option -g prefix M-s

            # bind-key h select-pane -L
            # bind-key j select-pane -D
            # bind-key k select-pane -U
            # bind-key l select-pane -R
        '';
    };
}
