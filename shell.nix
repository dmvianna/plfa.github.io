# the book only serves from the master branch;
# clones land on dev

with (import <nixpkgs> {});

let
  gems = bundlerEnv {
    name = "plfa.github.io";
    inherit ruby;
    gemdir = ./.;
  };

in stdenv.mkDerivation {
  name = "plfa.github.io";
  buildInputs = [gems ruby];
  shellHook = ''
    bundle exec jekyll serve
  '';
}
