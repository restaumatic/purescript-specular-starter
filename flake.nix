{
  description = "Specular starter";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
    easy-purescript-nix-source = {
      url = "github:justinwoo/easy-purescript-nix";
      flake = false;
    };
    flake-compat = {
      url = github:edolstra/flake-compat;
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, flake-compat, easy-purescript-nix-source }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
        easy-ps = import easy-purescript-nix-source { inherit pkgs; };
        inherit (easy-ps) psa purescript-language-server purs purs-tidy pscid spago;
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = with pkgs; [
            purescript-language-server
            purs
            purs-tidy
            spago
            nodejs
          ];
        };
      });
}
