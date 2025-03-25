{
    pkgs,
    inputs,
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
            vim-tmux-navigator
            yank
            resurrect
            {
                plugin = inputs.tmux-sessionx.packages.${pkgs.system}.default;
                extraConfig = '''';
            }
        ];
        extraConfig = # bash
            ''
                set-option -sa terminal-overrides ",xterm*:Tc"

                bind -n M-H previous-window
                bind -n M-L next-window

                unbind C-b
                set-option -g prefix M-s

                unbind o
                set -g @sessionx-bind 'o'
            '';
    };
}
