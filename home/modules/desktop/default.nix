{ pkgs, ... }:

{

  home.packages = with pkgs; [
    hyprshot    # Screenshots
    hyprpicker  # Color picker
  ];

  imports = [
    ./hyprland/hyprland.nix
    ./hyprland/hyprlock.nix
    ./hyprland/hyprpaper.nix
    ./waybar.nix
    ./wofi.nix
    ./swaync.nix
    ./theme.nix
  ];
}
