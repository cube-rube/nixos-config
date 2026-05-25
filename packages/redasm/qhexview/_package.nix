{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  qt6,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "qhexview";
  version = "5.1.0";

  src = fetchFromGitHub {
    owner = "Dax89";
    repo = "QHexView";
    rev = "v${finalAttrs.version}";
    hash = "";
  };

  nativeBuildInputs = [
    cmake
    # qt6.wrapQtAppsHook
  ];
  buildInputs = [ qt6.qtbase ];

  meta = {
    description = "A versatile Hexadecimal widget for Qt6";
    license = lib.licenses.mit;
    homepage = "https://github.com/Dax89/QHexView";
  };
})
