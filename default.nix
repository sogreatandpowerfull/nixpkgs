{
  pkgs ?
    import (fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixpkgs-unstable.tar.gz";
    }) {},
}:
with pkgs; let
  packages = rec {
    hblock = callPackage ./pkgs/hblock {};

    # similar to `pkgs = pkgs;` This lets callers use the nixpkgs version defined in this file.
    inherit pkgs;
  };
in
  packages
