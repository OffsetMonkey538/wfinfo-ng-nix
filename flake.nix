{
  description = "Nix package for wfinfo-ng";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
    in
    {
      packages = nixpkgs.lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs { inherit system; };
          wfinfo-ng = pkgs.callPackage ./package.nix {};
        in
        {
          wfinfo-ng = wfinfo-ng;
          default = wfinfo-ng;
        }
      );
    };
}
