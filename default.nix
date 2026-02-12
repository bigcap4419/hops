{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc9103" }:
nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./hops.nix { }
