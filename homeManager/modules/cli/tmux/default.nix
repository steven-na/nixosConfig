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
            {
                plugin = inputs.tmux-sessionx.packages."x86_64-linux".default;
            }
        ];
        extraConfig = # bash
            ''
                unbind C-b
                set-option -g prefix M-s

                unbind o
                set -g @sessionx-bind 'o'
            '';
    };
}
