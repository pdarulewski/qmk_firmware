{
  description = "qmk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        formatter = pkgs.nixfmt-tree;
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.python3
            pkgs.dos2unix
            pkgs.pkgsCross.avr.buildPackages.gcc
            pkgs.qmk
          ];
        };
      }
    );
}
# qmk setup -h ~/dev/github.com/qmk/qmk_firmware
