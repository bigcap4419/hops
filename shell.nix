{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc9103" }:
(import ./default.nix { inherit nixpkgs compiler; }).env
