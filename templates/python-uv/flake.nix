{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = [ 
          pkgs.uv 
          pkgs.python3 
        ];
        shellHook = ''
          echo "🐍 Python (uv) environment loaded"
          # Optional: auto-sync uv if a pyproject.toml exists
          # uv sync
        '';
      };
    };
}
