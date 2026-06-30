{ config, pkgs, ... }:

{
  # 1. Install uv system-wide
  environment.systemPackages = [
    pkgs.uv
  ];

  # 2. Enable nix-ld to bridge the gap for unpatched pre-compiled binaries
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      # Standard fundamental requirements for common pip wheels
      stdenv.cc.cc.lib
      glibc
      zlib
      openssl
      libffi
      stdenv.cc.cc 
      # Additional libraries helpful for ML/Data-Science utilities
      gcc-unwrapped.lib
    ];
  };
}
