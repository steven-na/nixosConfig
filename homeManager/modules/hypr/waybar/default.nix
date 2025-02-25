{ inputs, pkgs, ... }:
{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          output = [
            "eDP-2"
          ];
          modules-left = [ "hyprland/workspaces" ];
          modules-center = [ "hyprland/window" ];
          modules-right = [ "temperature" "cpu" "battery" "bluetooth" "network" "clock" "tray" "custom/notification" ];
      
          "hyprland/workspaces" = {
            all-outputs = true;
          };

          "custom/notification" = {
            tooltip = false;
            format = "";
            on-click = "swaync-client -t -sw";
            escape = true;
          };

          "cpu" = {
            interval = 1;
            format = "CPU {usage:2}%";
          };

          "bluetooth" = {
            format = "";
            format-disabled = "";
            format-connected = "";
            tooltip-format = "{controller_alias}\t{controller_address}\n\nNo Connections";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";
          };

          "network" = {
            format-wifi = " ";
            format-ethernet = "";
            format-disconnected = "";
            tooltip-format-disconnected = "Error";
            tooltip-format-wifi = "{essid} ({signalStrength}%) ";
            tooltip-format-ethernet = "{ifname} ";
          };
          
          "battery" = {
            interval = 60;
            states = {
              warning = 30;
              critical = 15;
            };
            format = "BAT {capacity}%";
          };
        };
      };
      style = #c
      ''
@define-color nord0 #2E3440;
@define-color nord1 #3B4252;
@define-color nord2 #434C5E;
@define-color nord3 #4C566A;
@define-color nord4 #D8DEE9;
@define-color nord5 #E5E9F0;
@define-color nord6 #ECEFF4;
@define-color nord7 #8FBCBB;
@define-color nord8 #88C0D0;
@define-color nord9 #81A1C1;
@define-color nord10 #5E81AC;
@define-color nord11 #BF616A;
@define-color nord12 #D08770;
@define-color nord13 #EBCB8B;
@define-color nord14 #A3BE8C;
@define-color nord15 #B48EAD;

* {
    font-size:13px;
    font-family: "JetBrainsMono Nerd Font";
}
window#waybar{
    all:unset;
}
tooltip {
    background:alpha(@nord0, .825);
    color: @nord5;
}
.modules-left {
    padding:2px;
    border-radius: 0 0 10 10;
    margin:0 6 1 6;
    background: alpha(@nord0,.75);
}
.modules-center {
    padding:2px;
    border-radius: 0 0 10 10;
    margin:0 6 1 6;
    background: alpha(@nord0,.75);
}

.modules-right {
    padding:2px;
    border-radius: 0 0 10 10;
    margin:0 6 1 6;
    background: alpha(@nord0,.75);
}
#clock:hover, #custom-pacman:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
    transition: all .3s ease;
    color: @nord8;
}
#custom-notification {
    padding: 0px 5px;
    transition: all .3s ease;
    color:@nord5;
}
#clock{
    padding: 0px 5px;
    color:@nord5;
    transition: all .3s ease;
}
#workspaces {
    padding: 0px 5px;
}
#workspaces button {
    all:unset;
    padding: 0px 5px;
    color: alpha(@nord5,.4);
    transition: all .2s ease;
}
#workspaces button:hover {
    color:@nord7;
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
}
#workspaces button.active {
    color: @nord6;
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}
#workspaces button.empty {
    color: rgba(0,0,0,0);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
}
#workspaces button.empty:hover {
    color: rgba(0,0,0,0);
    border: none;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
    transition: all 1s ease;
}
#workspaces button.empty.active {
    color: @nord4;
    border: none;
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
}
#bluetooth{
    padding: 0px 5px;
    transition: all .3s ease;
    color:@nord5;

}
#network{
    padding: 0px 5px;
    transition: all .3s ease;
    color:@nord5;

}
#battery{
    padding: 0px 5px;
    transition: all .3s ease;
    color:@nord5;


}
#battery.charging {
    color: @nord14;
}

#battery.warning:not(.charging) {
    color: @nord13;
}

#battery.critical:not(.charging) {
    color: @nord11;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}
#group-expand{
    padding: 0px 5px;
    transition: all .3s ease; 
}
#custom-expand{
    padding: 0px 5px;
    color:alpha(@nord5,.2);
    text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
    transition: all .3s ease; 
}
#custom-expand:hover{
    color:rgba(255,255,255,.2);
    text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
}
#custom-colorpicker{
    padding: 0px 5px;
}
#cpu,#memory,#temperature{
    padding: 0px 5px;
    transition: all .3s ease; 
    color:@nord5;

}
#custom-endpoint{
    color:transparent;
    text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

}
#tray{
    padding: 0px 5px;
    transition: all .3s ease; 

}
#tray menu * {
    padding: 0px 5px;
    transition: all .3s ease; 
}

#tray menu separator {
    padding: 0px 5px;
    transition: all .3s ease; 
}
      '';
    };
  };
}
