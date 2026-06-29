{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;
    
    shellAliases = {
      ls = "eza --group-directories-first --icons -lhg";
      cp = "cp --verbose";
    };

    # Paste your large collection of custom prompts, exports, and scripts here
    extraConfig = ''
      # Custom exports
      export EDITOR="vim"
      
      # Your custom functions or initialization scripts go here safely...
    '';
  };
}
