{ pkgs ? import <nixpkgs> {} }:

with pkgs;
stdenv.mkDerivation rec {
    pname = "nbackbright";
    version = "0.1.0";
    
    src = fetchFromGitHub {
        owner = "punzik";
        repo  = "nbackbright";
        rev = "558633c61da2a8cdcf2d46e38cdd44a5e43f09d1";
        sha256 = "0756bw8qg608w67q4b5y27b3dbqv0dd2rflsdr3270avxwiybk41";
    };

    buildInputs = [ nim ];
    buildPhase = ''
        make
    '';

    installPhase = ''
        mkdir -p $out/bin
        mv nbackbright $out/bin
    '';
}
