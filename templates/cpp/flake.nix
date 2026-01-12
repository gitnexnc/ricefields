{
  description = "C++ Development Environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        # Tools for building and debugging
        packages = with pkgs; [
          clang-tools # Includes clangd (LSP)
          cmake
          gnumake
          gdb
          valgrind    # For memory leak checking
        ];

        # Set environment variables for compilers
        shellHook = ''
          export CC=clang
          export CXX=clang++
          echo "──────────────────────────────────────────────────"
          echo "    C/C++ Dev Environment Loaded"
          echo "  Compiler: $(clang --version | head -n1)"
          echo "  Build:    $(cmake --version | head -n1)"
          echo "──────────────────────────────────────────────────"
        '';
      };
    };
}
