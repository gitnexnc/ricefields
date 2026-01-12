{
  description = "Master Template Collection";

  outputs = { self }: {
    templates = {
      # The default template (nix flake init -t univ)
      blank = {
        path = ./blank;
        description = "Minimal flake with direnv auto-loading";
      };

      python-uv = {
        path = ./python-uv;
        description = "Python environment with uv and direnv";
      };

      rust = {
        path = ./rust;
        description = "Rust development environment (Cargo/Analyzer)";
      };
    };

    defaultTemplate = self.templates.blank;
  };
}
