{ config, pkgs, ... }:

{
  home.packages = [
    # Wrap the python interpreter with the math extensions you want globally
    (pkgs.python314.withPackages (ps: with ps; [
      numpy
      scipy
      matplotlib
    ]))
  ];
}
