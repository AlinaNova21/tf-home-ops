{pkgs, ...}:
with pkgs;
  mkShell {
    buildInputs = [
      terraform
    ];
  }
