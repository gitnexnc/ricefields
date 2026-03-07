{ pkgs, inputs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --remember-user-session --asterisks --cmd niri";
      user = "greeter";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
    config.niri = {
      default = [ "hyprland" "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  console.keyMap = "us";

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    font-awesome
    noto-fonts
    noto-fonts-color-emoji
  ];

  programs.gnome-disks.enable = true;

  services = {
    gvfs.enable    = true;
    udisks2.enable = true;
    blueman.enable = true;
    tumbler.enable = true;
    printing.enable = true;
    flatpak.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  security = {
    polkit.enable = true;
    sudo.wheelNeedsPassword = true;
    pam.services.greetd.enableGnomeKeyring = true;
  };

  environment.profileRelativeEnvVars.XDG_DATA_DIRS = [ "share" ];
  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/glib-2.0/schemas";
  };

  environment.systemPackages = with pkgs; [
    busybox
    wget
    curl
    nautilus
    gparted
    udiskie
    kdePackages.polkit-kde-agent-1
    ddcutil
    podman-tui
    podman-compose
    slirp4netns
    fuse-overlayfs
    libsecret
    sops
    age
    gamemode
    vulkan-tools
    vulkan-loader
    amdgpu_top
    mangohud
    xwayland-satellite
  ];

  programs.fish.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  system.autoUpgrade = {
    enable = false;
    allowReboot = false;
  };
}
