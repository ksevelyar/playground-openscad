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
            (pkgs.writeShellScriptBin "render-stl" ''
              set -euo pipefail

              render_one() {
                scad="$1"
                stl="''${scad%.scad}.stl"
                output=$(openscad -o "$stl" "$scad" 2>&1) || {
                  rm -f "$stl"
                  if echo "$output" | grep -q "top level object is empty"; then
                    echo "skip: $scad"
                    return 0
                  fi
                  echo "FAILED: $scad"
                  echo "$output" | tail -5
                  return 1
                }
                echo "render: $scad"
              }
              export -f render_one

              find . -name '*.scad' -type f | sed 's|^\./||' | \
                xargs -P "$(nproc)" -I{} bash -c 'render_one "$@"' _ {}
            '')
          ];
        };
      }
    );
}
