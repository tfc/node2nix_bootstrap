{
  pkgs ? import <nixpkgs> { inherit system; },
  system ? builtins.currentSystem
}:

let
  bootstrapPackage = (import ./default.nix { inherit pkgs system; }).package;
  stylePatch = ./style.patch;
in
  bootstrapPackage.override {
    src = pkgs.fetchgit {
      url = "git://github.com/twbs/bootstrap.git";
      rev = "8a628b943cf31ca0a002c08af661a95772480225";
      sha256 = "1lrzqr9z3v0izvsvz7gn6ddf0564plqmq1zfndfvjj0bzfx6qy1l";
    };

    preRebuild = "patch -p1 < ${stylePatch};";
    postInstall = ''
      npm i npm
      npm install
      npm run css-compile
    '';
  }
