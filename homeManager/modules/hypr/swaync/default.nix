{ pkgs, config, ... }:
{
  services.swaync = {
    enable = true;
    settings = {
      schema = "/etc/xdg/swaync/configSchema.json";
      positionX = "right";
      positionY = "bottom";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-width = 350;
      control-center-margin-top = 8;
      control-center-margin-bottom = 8;
      control-center-margin-right = 0;
      control-center-margin-left = 8;
      notification-2fa-action = true;
      notification-inline-replies = true;
      notification-window-width = 350;
      notification-icon-size = 60;
      notification-body-image-height = 180;
      notification-body-image-width = 180;
      timeout = 12;
      timeout-low = 6;
      timeout-critical = 1;
      fit-to-screen = true;
      keyboard-shortcuts = true;
      image-visibility = "when available";
      transition-time = 200;
      hide-on-clear = false;
      hide-on-action = true;
      script-fail-notify = true;
      # widgets = ["mpris" "title" "notifications" "volume" "backlight" "buttons-grid"];
      widgets = [ "title" "notifications" ];
      widget-config = {
          title = {
              text = "Notification Center";
              clear-all-button = true;
              button-text = "󰆴";
          };
          label = {
              max-lines = 1;
              text = "Notification Center!";
          };
          mpris = {
              image-size = 80;
              image-radius = 0;
          };
          volume = {
              label = "󰕾 ";
          };
          backlight = {
              label = "󰃟 ";
          };
          buttons-grid = {
              actions = [
                  # { label = "󰝟"; command = "pactl set-sink-mute @DEFAULT_SINK@ toggle"; type = "toggle"; }
                  # { label = "󰍭"; command = "pactl set-source-mute @DEFAULT_SOURCE@ toggle"; type = "toggle"; }
                  { label = ""; command = "ghostty nmtui"; }
                  { label = ""; command = "blueman-manager"; }
                  { label = "󰤄"; command = "swaync-client -d"; type = "toggle"; }
                  # { label = ""; command = "hyprlock"; }
                  { label = ""; command = "reboot"; }
                  { label = ""; command = "shutdown now"; }
              ];
          };
      };
    };
    # https://github.com/elifouts/Dotfiles/blob/main/.config/swaync/style.css
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

@define-color mpris-album-art-overlay alpha(@nord0, 0.55);
@define-color mpris-button-hover alpha(@nord0, 0.50);
@define-color text @nord5;
@define-color bg alpha(@nord0,.8);
@define-color bg-hover alpha(@nord0,.9);
@define-color border-color alpha(@nord1, 0.15);

@keyframes fadeIn{
0% {
    padding-left:20;
    margin-left:50;
    margin-right:50;
}
100% {
    padding:0;
    margin:0;
}
}
* {
    outline:none;
}
.control-center .notification-row {
    background-color: unset;
}
.control-center .notification-row .notification-background .notification,
.control-center .notification-row .notification-background .notification .notification-content,
.floating-notifications .notification-row .notification-background .notification,
.floating-notifications.background .notification-background .notification .notification-content {
}
.notification{
    background: alpha(@nord0,.5);

}

.control-center .notification-row .notification-background .notification {
    margin-top: 0.150rem;
    /*box-shadow: 1px 1px 5px rgba(0, 0, 0, .3);*/
    background: alpha(@nord0,.3);

}
.floating-notifications .notification{
    animation: fadeIn .5s ease-in-out;
}

.control-center .notification-row .notification-background .notification box,
.control-center .notification-row .notification-background .notification widget,
.control-center .notification-row .notification-background .notification .notification-content,
.floating-notifications .notification-row .notification-background .notification box,
.floating-notifications .notification-row .notification-background .notification widget,
.floating-notifications.background .notification-background .notification .notification-content {
    border-radius: 0.818rem;

}
.notification widget:hover{
    background:alpha(@nord0,.2);
}
.floating-notifications.background .notification-background .notification .notification-content,
.control-center .notification-background .notification .notification-content {
    padding-top: 0.818rem;
    padding-right: unset;
    margin-right: unset;
}

.control-center .notification-row .notification-background .notification.low .notification-content label,
.control-center .notification-row .notification-background .notification.normal .notification-content label,
.floating-notifications.background .notification-background .notification.low .notification-content label,
.floating-notifications.background .notification-background .notification.normal .notification-content label {
    padding-top:10px;
    padding-left:10px;
    padding-right:10px;
}

.control-center .notification-row .notification-background .notification..notification-content image,
.control-center .notification-row .notification-background .notification.normal .notification-content image,
.floating-notifications.background .notification-background .notification.low .notification-content image,
.floating-notifications.background .notification-background .notification.normal .notification-content image {
    background-color: unset;
}

.control-center .notification-row .notification-background .notification.low .notification-content .body,
.control-center .notification-row .notification-background .notification.normal .notification-content .body,
.floating-notifications.background .notification-background .notification.low .notification-content .body,
.floating-notifications.background .notification-background .notification.normal .notification-content .body {
    color: @text;
}

.control-center .notification-row .notification-background .notification.critical .notification-content,
.floating-notifications.background .notification-background .notification.critical .notification-content {
    background-color: #ffb4a9;

}

.control-center .notification-row .notification-background .notification.critical .notification-content image,
.floating-notifications.background .notification-background .notification.critical .notification-content image{
    background-color: unset;
    color: @text;

}

.control-center .notification-row .notification-background .notification.critical .notification-content label,
.floating-notifications.background .notification-background .notification.critical .notification-content label {
    color: @text;

}
.notification-content{
    padding:5;
}
.control-center .notification-row .notification-background .notification .notification-content .summary,
.floating-notifications.background .notification-background .notification .notification-content .summary {
    font-family: 'CodeNewRoman Nerd Font Propo';
    font-size: 0.9909rem;
    font-weight: 500;
}

.control-center .notification-row .notification-background .notification .notification-content .time,
.floating-notifications.background .notification-background .notification .notification-content .time {
    font-size: 0.8291rem;
    font-weight: 500;
    margin-right: 1rem;
    padding-right: unset;
}

.control-center .notification-row .notification-background .notification .notification-content .body,
.floating-notifications.background .notification-background .notification .notification-content .body {
    font-family: 'CodeNewRoman Nerd Font Propo';
    font-size: 0.8891rem;
    font-weight: 400;
    margin-top: 0.310rem;
    padding-right: unset;
    margin-right: unset;
}

.control-center .notification-row .close-button,
.floating-notifications.background .close-button {
    all:unset;
    background-color: unset;
    border-radius: 0%;
    border: none;
    box-shadow: none;
    margin-right: 0px;
    margin-top: 3px;
    margin-bottom: unset;
    padding-bottom: unset;
    min-height: 20px;
    min-width: 20px;
    text-shadow: none;
    color:@text;
}

.control-center .notification-row .close-button:hover,
.floating-notifications.background .close-button:hover {
    all:unset;
    background-color: @bg;
    border-radius: 100%;
    border: none;
    box-shadow: none;
    margin-right: 0px;
    margin-top: 3px;
    margin-bottom: unset;
    padding-bottom: unset;
    min-height: 20px;
    min-width: 20px;
    text-shadow: none;
    color:@text;

}

.control-center {
    background: @bg;
    color: @text;
    border-radius: 10px;
    border:none;
    /*box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);*/
}
.widget-title {
    padding:unset;
    margin:unset;
    color: @text;
    padding-left:20px;
    padding-top:20px;
}

.widget-title > button {
    padding:unset;
    margin:unset;
    font-size: initial;
    color: @text;
    text-shadow: none;
    background: alpha(@nord2, .3);
    border: none;
    box-shadow: none;
    border-radius: 12px;
    padding:0px 10px;
    margin-right:20px;
    margin-top:3px;
    transition: all .7s ease;
}

.widget-title > button:hover {
    border: none;
    background: @nord2;
    transition: all .7s ease;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, .65);
}

.widget-label {
    margin: 8px;
}

.widget-label > label {
    font-size: 1.1rem;
}

.widget-mpris {
}
.widget-mpris .widget-mpris-player {
    padding: 16px;
    margin: 16px 20px;
    background-color: @mpris-album-art-overlay;
    border-radius: 12px;
    box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);
}
.widget-mpris .widget-mpris-player button:hover {
    all: unset;
    background: @nord2;
    text-shadow: none;
    border-radius: 15px;
    border: none; 
    padding: 5px; 
    margin: 5px;
    transition: all 0.5s ease; 
}
.widget-mpris .widget-mpris-player button {
    color:@text;
    text-shadow: none;
    border-radius: 15px;
    border: none;
    padding: 5px;
    margin: 5px;
    transition: all 0.5s ease;
}
.widget-mpris .widget-mpris-player button:not(.selected) {
    background: transparent;
    border: 2px solid transparent;
}
.widget-mpris .widget-mpris-player button:hover {
    border: 2px solid transparent;
}

.widget-mpris .widget-mpris-player .widget-mpris-album-art {
    border-radius: 20px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.75);
}

.widget-mpris .widget-mpris-player .widget-mpris-title {
    font-weight: bold;
    font-size: 1.25rem;
}

.widget-mpris .widget-mpris-player .widget-mpris-subtitle {
    font-size: 1.1rem;
}

.widget-mpris .widget-mpris-player > box > button:hover {
    background-color: @mpris-button-hover;
}
.widget-buttons-grid {
    font-family:"CodeNewRoman Nerd Font Propo";
    padding-left: 8px;
    padding-right: 8px;
    padding-bottom: 8px;
    margin: 10px;
    border-radius: 12px;
    background:transparent;
}

.widget-buttons-grid>flowbox>flowboxchild>button label {
    font-size: 20px;
    color: @color7;
    transition: all .7s ease;
}
.widget-buttons-grid>flowbox>flowboxchild>button:hover label {
    font-size: 20px;
    color: @text;
    transition: all .7s ease;
}
.widget-buttons-grid > flowbox > flowboxchild > button {
    background: transparent;
    border-radius: 12px;
    text-shadow:none;
    box-shadow: 0px 0px 8px rgba(255,255,255, .02);
    transition: all .5s ease;
}
.widget-buttons-grid > flowbox > flowboxchild > button:hover {
    background: @bg;
    box-shadow: 0px 0px 2px rgba(0, 0, 0, .2);
    transition: all .5s ease;

}

.widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
    background: @bg;
}
.widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked label {
    color: @background;
}

.widget-menubar > box > .menu-button-bar > button {
    border: none;
    background: transparent;
}

.topbar-buttons > button {
    border: none;
    background: transparent;
}

trough {
    border-radius: 20px;
    background: transparent;
}

trough highlight {
    padding: 5px;
    background: @bg;
    border-radius: 20px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, .5);
    transition: all .7s ease;
}
trough highlight:hover {
    padding: 5px;
    background: @bg;
    border-radius: 20px;
    box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
    transition: all .7s ease;
}

trough slider {
    background: transparent;
}
trough slider:hover {
    background: transparent;
}

.widget-volume {
    background-color: alpha(@nord1, 0.5);
    padding: 8px;
    margin: 8px;
    border-radius: 12px;
}
.widget-backlight {
    background-color: transparent;
    padding: 8px;
    margin: 8px;
    border-radius: 12px;
}
    '';
  };
}
