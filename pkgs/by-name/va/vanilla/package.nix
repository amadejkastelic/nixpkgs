{ lib
, stdenv
, fetchFromGitHub
, cmake
, pkg-config
, SDL2
, SDL2_image
, SDL2_ttf
, ffmpeg
, libnl
, openssl
, libxml2
, networkmanager
}:

stdenv.mkDerivation rec {
  pname = "vanilla";
  version = "unstable-2025-05-27"; # Package is not tagged upstream, use date as version

  src = fetchFromGitHub {
    owner = "vanilla-wiiu";
    repo = "vanilla";
    rev = "30eefb7e0c71145e73744e80c63b5547608f4094";
    hash = lib.fakeHash;
  };

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    SDL2
    SDL2_image
    SDL2_ttf
    ffmpeg
    libnl
    openssl
    libxml2
    networkmanager
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
  ];

  meta = with lib; {
    description = "Work-in-progress software clone of the Wii U gamepad for Linux and other platforms";
    homepage = "https://github.com/vanilla-wiiu/vanilla";
    license = licenses.gpl2Only;
    platforms = platforms.linux;
    maintainers = [ lib.maintainers.amadejkastelic ];
  };
}
