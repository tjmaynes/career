with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "career";
  buildInputs = [
    texlive.combined.scheme-full
  ];
  shellHook = ''
  '';
}
