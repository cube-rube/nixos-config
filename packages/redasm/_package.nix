{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  qt6,
  qhexview,
  libredasm,
  ...
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "redasm";
  version = "3.0.0-beta5";

  src = fetchFromGitHub {
    owner = "redasm-dev";
    repo = "redasm";
    rev = "v${finalAttrs.version}";
    hash = "sha256-uU4D7Zv4XFRd+P4KWjDN4LUFq0OMH6nc4xtslDlG5uo=";
  };

  nativeBuildInputs = [
    cmake
    qt6.wrapQtAppsHook
  ];
  buildInputs = [
    qt6.qtbase
    qhexview
    libredasm
  ];

  cmakeFlags = [
    "-Dredasm_DIR=${libredasm}/lib/cmake/redasm"
    "-DQHexView_DIR=${qhexview}/lib/cmake/QHexView"
  ];

  meta = {
    description = "A free and open source disassembler";
    homepage = "https://redasm.dev/";
    license = lib.licenses.gpl3;
    mainProgram = "redasm";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.fromSource ];
  };
})
