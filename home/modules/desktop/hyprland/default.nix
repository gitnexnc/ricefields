{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprlock
    hyprcursor
    hyprutils
    hyprpicker
    hyprsunset
    hyprshot
    hyprgraphics

    wofi
    swaynotificationcenter
  ];

  home.file.".config/hypr/hyprland.conf".source =
    ./hyprland.conf;
}

