{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  pkg-config,
  sqlite,
  tomlc17,
}:

stdenv.mkDerivation (_finalAttrs: {
  pname = "libredasm";
  version = "master";

  src = fetchFromGitHub {
    owner = "redasm-dev";
    repo = "core";
    rev = "19f583ced6e597985de3909f5e71065e67b5c5ce";
    hash = "sha256-lHsdb3bg6d5wNLzbQYlIbkcMnF+4RjgckUcAYUf7yjU=";
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];
  buildInputs = [
    sqlite
    tomlc17
  ];

  meta = {
    description = "REDasm Core Library";
    license = lib.licenses.gpl3;
    homepage = "https://github.com/REDasmOrg/REDasm-Library";
  };
})
