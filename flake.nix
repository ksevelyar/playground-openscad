{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachSystem ["x86_64-linux"] (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            openscad-unstable
            openscad-lsp
            fd
            topiary

            (pkgs.writeShellScriptBin "render-and-format" ''
              set -euo pipefail
              while IFS= read -r scad; do
                topiary format --skip-idempotence "$scad"
                stl="''${scad%.scad}.stl"
                output=$(openscad -o "$stl" "$scad" 2>&1) || {
                  rm -f "$stl"
                  if echo "$output" | grep -q "top level object is empty"; then
                    echo "skip: $scad"
                    continue
                  fi
                  echo "FAILED: $scad"
                  echo "$output" | tail -5
                  exit 1
                }
                echo "render: $scad"
              done < <(fd --extension scad --exclude tmp --type file)
            '')

            (pkgs.writeShellScriptBin "format-check" ''
              set -euo pipefail
              status=0
              while IFS= read -r scad; do
                topiary format --language openscad < "$scad" | diff -u "$scad" - >/dev/null || {
                  echo "unformatted: $scad"
                  status=1
                }
              done < <(fd --extension scad --exclude tmp --type file)
              exit "$status"
            '')
          ];
        };
      }
    );
}
