{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Hyprland ecosystem utilities
    hyprshot
    hyprlock
    hyprcursor
    hyprpaper
    hyprgraphics
    hyprutils
    hyprsunset
    hyprpicker

    # Wayland desktop components
    waybar
    wofi
    swaynotificationcenter
  ];
}

