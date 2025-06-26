{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = (import (inputs.nixpkgs) { inherit system; });
      in {
        devShell = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nodePackages.live-server
            tailwindcss
            nodePackages.vscode-langservers-extracted
            just
          ];
        };
      }
    );
}
