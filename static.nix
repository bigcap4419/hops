{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc9103" }:

let
  pkgs = nixpkgs.pkgsStatic;
  haskellPackages = pkgs.haskell.packages.${compiler};

  hops = haskellPackages.callPackage ./hops.nix { };

in hops.overrideAttrs (old: {
  enableSharedExecutables = false;
  enableSharedLibraries = false;
  configureFlags = (old.configureFlags or []) ++ [
    "--ghc-option=-optl=-static"
    "--ghc-option=-optl=-pthread"
  ];
  # Strip the binary for a smaller result.
  postInstall = (old.postInstall or "") + ''
    ${pkgs.stdenv.cc.targetPrefix}strip $out/bin/hops
  '';
})
