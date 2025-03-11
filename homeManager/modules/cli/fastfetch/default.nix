{
    config,
    ...
}:
{
    home.file.".config/fastfetch/logo.png" = {
        source = ./logo/logo.png;
        force = true;
    };

    programs.fastfetch = {
        enable = true;
        settings = {
            logo = {
                source = "${config.home.homeDirectory}/.config/fastfetch/logo.png";
                height = 16;
                type = "kitty";
                padding = {
                    right = 1;
                    top = 1;
                    left = 1;
                };
            };
            display = {
                separator = "  ";
            };
            modules = [
                {
                    type = "title";
                    format = "{#1}╭─ {#}{user-name-colored} ──────────────────────╮";
                }
                # -- System Information
                {
                    type = "custom";
                    format = "{#1}│ {#}System Information";
                }
                {
                    type = "os";
                    key = "{#separator}│  {#keys}󰍹 OS";
                }
                {
                    type = "kernel";
                    key = "{#separator}│  {#keys}󰒋 Kernel";
                }
                # {
                #   type = "uptime";
                #   key = "{#separator}│  {#keys}󰅐 Uptime";
                # }
                # {
                #   type = "packages";
                #   key = "{#separator}│  {#keys}󰏖 Packages";
                #   format = "{all}";
                # }
                {
                    type = "custom";
                    format = "{#1}│";
                }
                # -- Desktop Environment
                {
                    type = "custom";
                    format = "{#1}│ {#}Desktop Environment";
                }
                {
                    type = "de";
                    key = "{#separator}│  {#keys}󰧨 DE";
                }
                {
                    type = "wm";
                    key = "{#separator}│  {#keys}󱂬 WM";
                }
                {
                    type = "wmtheme";
                    key = "{#separator}│  {#keys}󰉼 Theme";
                }
                # {
                #   type = "display";
                #   key = "{#separator}│  {#keys}󰹑 Resolution";
                # }
                {
                    type = "shell";
                    key = "{#separator}│  {#keys}󰞷 Shell";
                }
                {
                    type = "terminalfont";
                    key = "{#separator}│  {#keys}󰛖 Font";
                }
                {
                    type = "custom";
                    format = "{#1}│";
                }
                # -- Hardware Information
                {
                    type = "custom";
                    format = "{#1}│ {#}Hardware Information";
                }
                {
                    type = "cpu";
                    key = "{#separator}│  {#keys}󰻠 CPU";
                }
                {
                    type = "gpu";
                    key = "{#separator}│  {#keys}󰢮 GPU";
                }
                {
                    type = "memory";
                    key = "{#separator}│  {#keys}󰍛 Memory";
                }
                {
                    type = "disk";
                    key = "{#separator}│  {#keys}󰋊 Disk (/)";
                    folders = "/";
                }
                {
                    type = "custom";
                    format = "{#1}│";
                }
                # -- Colors
                {
                    type = "colors";
                    key = "{#separator}│";
                    symbol = "circle";
                }
                # -- Footer
                {
                    type = "custom";
                    format = "{#1}╰───────────────────────────────╯";
                }
            ];
        };
    };
}
