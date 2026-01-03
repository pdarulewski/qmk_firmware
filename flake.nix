{
  description = "qmk";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    # gcc-arm-embedded-14.3.rel1 not available anymore on x86_64-darwin\
    # https://github.com/NixOS/nixpkgs/pull/428874
    qmk117.url = "github:nixos/nixpkgs/3d1f29646e4b57ed468d60f9d286cde23a8d1707";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        setup = pkgs.writeShellApplication {
          name = "setup";
          text = ''
            echo "Setting up qmk"
            qmk setup -h ~/dev/github.com/pdarulewski/qmk_firmware
          '';
        };

        compile = pkgs.writeShellApplication {
          name = "compile";
          text = ''
            echo "Compiling sofle pd"
            qmk compile -kb keebart/sofle_choc_pro -km pd --compiledb
          '';
        };

        flash = pkgs.writeShellApplication {
          name = "flash";
          text = ''
            echo "Compiling sofle pd"
            qmk flash -kb keebart/sofle_choc_pro -km pd
          '';
        };

        pkgs = nixpkgs.legacyPackages.${system};

        qmk =
          if system == flake-utils.lib.system.x86_64-darwin
          then inputs.qmk117.legacyPackages.${system}.qmk
          else pkgs.qmk;

        qmkPackages = [
          pkgs.python3
          pkgs.dos2unix
          pkgs.pkgsCross.avr.buildPackages.gcc
          qmk

          setup
          compile
          flash
        ];
      in {
        devShells.default = pkgs.mkShell {
          packages = qmkPackages;
        };
      }
    );
}
