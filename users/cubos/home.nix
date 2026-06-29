{ config, pkgs, ... }:

{
  home.username = "cubos";
  home.homeDirectory = "/home/cubos";
  home.stateVersion = "26.05"; # Match your system's stateVersion

  # Let Home Manager manage itself (necessary)
  programs.home-manager.enable = true;

  # Imports user-specific modular apps
  imports = [
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
  };
  xdg.configFile."hypr/hyprland.lua".source = ./hyprland.lua;
  xdg.configFile."waybar/config".source = ./waybar/config;
  xdg.configFile."waybar/style.css".source = ./waybar/style.css;

  # User specific packages go here instead of configuration.nix
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    # Any personal apps can live here safely separated from root
    btop
    wezterm
    wofi
    waybar
    wl-clipboard
    hyprpaper
    fastfetch
    htop
    starship
    wlogout
    nerd-fonts.comic-shanns-mono
  ];
  
}
