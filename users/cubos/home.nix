{ config, pkgs, ... }:

{
  home.username = "cubos";
  home.homeDirectory = "/home/cubos";
  home.stateVersion = "26.05"; # Match your system's stateVersion

  # Let Home Manager manage itself (necessary)
  programs.home-manager.enable = true;

  # Imports user-specific modular apps
  imports = [
    ./homedots/bash.nix
  ];
  
  wayland.windowManager.hyprland = {
    enable = true;
  };
  # Change this line in your home.nix to reference the absolute physical path
  xdg.configFile."hypr/hyprland.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/hyprland/hyprland.lua";
    
  # Do the same for your waybar configs if you are actively tweaking them
  xdg.configFile."waybar/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/config";
  xdg.configFile."waybar/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/waybar/style.css";
  xdg.configFile."wofi/config".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/config";
  xdg.configFile."wofi/style.css".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wofi/style.css";
  xdg.configFile."starship.toml".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/starship/starship.toml";
  xdg.configFile."wezterm/wezterm.lua".source = 
    config.lib.file.mkOutOfStoreSymlink "/home/cubos/dotfiles/users/cubos/wezterm/wezterm.lua";

  # User specific packages go here instead of configuration.nix
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
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
    eza
    starship
    discord
  ];
  
}
