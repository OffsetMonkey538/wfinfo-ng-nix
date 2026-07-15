{
  lib,
  rustPlatform,
  fetchFromGitHub,
  cmake,
  pkg-config,
  openssl,
  libx11,
  libxi,
  libxtst,
  leptonica,
  fontconfig,
  tesseract,
  libxcb,
  libXcursor,
}:

rustPlatform.buildRustPackage rec {
  pname = "wfinfo-ng";
  version = "0.1.0-unstable-2026-05-16";

  src = fetchFromGitHub {
    owner = "knoellle";
    repo = pname;
    rev = "2c6fbe6a2be160b6996857f0e72f339fad5273d3";
    hash = "sha256-CvgJAwYz2/4ivPd4jw5zXdToiRmjJI9Yq6OzVahgQ94=";
  };

  cargoHash = "sha256-qz4hKQP9+FcsmboHsEbR+Z19aWD65Ytj8iQVyYphQYA=";

  cargoBuildFlags = [
    "--bin"
    "wfinfo"
  ];

  # The tests expect filtered_items.json and prices.json to be present in the working directory, which isn't the case while building.
  #  At runtime though it should be downloading them, so no need to try including them in the build somehow afaik.
  doCheck = false;

  preBuild = ''
    export CMAKE_POLICY_VERSION_MINIMUM=3.5
  '';

  nativeBuildInputs = [
    pkg-config
    cmake
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    openssl
    libx11
    libxi
    libxtst
    leptonica
    fontconfig
    tesseract
    libxcb
    libXcursor
  ];

  meta = with lib; {
    description = "A Linux compatible version of the great WFinfo. Analyze relic reward screen to determine platinum value of items.";
    homepage = "https://github.com/knoellle/wfinfo-ng";
    license = licenses.gpl3Only;
    mainProgram = "wfinfo";
    platforms = platforms.linux;
  };
}
