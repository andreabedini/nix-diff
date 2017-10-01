# You can build this repository using Nix by running:
#
#     $ nix-build release.nix
#
# You can also open up this repository inside of a Nix shell by running:
#
#     $ nix-shell
#
# ... and then Nix will supply the correct Haskell development environment for
# you
let
  config = {
    packageOverrides = pkgs: {
      haskellPackages = pkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: {
          nix-diff = haskellPackagesNew.callPackage ./default.nix { };

          prettyprinter = haskellPackagesNew.callPackage ./prettyprinter.nix { };
        };
      };
    };
  };

  pkgs =
    import <nixpkgs> { inherit config; };

in
  { nix-diff = pkgs.haskellPackages.nix-diff;
  }