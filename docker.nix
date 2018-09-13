{ pkgs ? import <nixpkgs> {} }:
let
    actix-hello-world = pkgs.rustPlatform.buildRustPackage rec {
        name = "actix-hello-world-${version}";
        version = "0.0.1";

        src = ./.;

        cargoSha256 = "03fcrrqypvnivv872frfdcjny4iljdka6kqipzkbnqxvvs41gmml";

};

in
with pkgs;
dockerTools.buildImage {
    name = "actix-hello-world";
    config = {
        Entrypoint = ["${actix-hello-world}/bin/actix-hello-world"];
        ExposedPorts = {
            "8088/tcp" = {};
        };
    };
}
