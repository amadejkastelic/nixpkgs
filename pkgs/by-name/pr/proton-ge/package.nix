{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  writeScript,
  cmake,
  git,
  pkg-config,
  python3,
  # Can be overridden to alter the display name in steam
  # This could be useful if multiple versions should be installed together
  steamDisplayName ? "GE-Proton",
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "proton-ge";
  version = "GE-Proton10-3";

  src = fetchFromGitHub {
    owner = "GloriousEggroll";
    repo = "proton-ge-custom";
    rev = finalAttrs.version;
    sha256 = "sha256-nykuHh4MMIvrSA/Xqd84lOsnt+U5/o8P1DdmWiGf9RU=";
    fetchSubmodules = true;
  };

  dontUseCmakeConfigure = true;

  dontConfigure = true;

  nativeBuildInputs = [
    cmake
    git
    pkg-config
    python3
    # Add other build dependencies as needed
  ];

  buildPhase = ''
    # Apply patches
    ./patches/protonprep-valve-staging.sh

    # Configure and build
    mkdir -p build
    cd build
    ../configure.sh --build-name=nix-proton-ge-${finalAttrs.version}
    make redist
  '';

  installPhase = ''
    runHook preInstall

    # Make it impossible to add to an environment. You should use the appropriate NixOS option.
    # Also leave some breadcrumbs in the file.
    echo "${finalAttrs.pname} should not be installed into environments. Please use programs.steam.extraCompatPackages instead." > $out

    mkdir $steamcompattool
    ln -s $src/* $steamcompattool
    rm $steamcompattool/compatibilitytool.vdf
    cp $src/compatibilitytool.vdf $steamcompattool

    runHook postInstall
  '';

  preFixup = ''
    substituteInPlace "$steamcompattool/compatibilitytool.vdf" \
      --replace-fail "${finalAttrs.version}" "${steamDisplayName}"
  '';

  meta = {
    description = ''
      Compatibility tool for Steam Play based on Wine and additional components.

      (This is intended for use in the `programs.steam.extraCompatPackages` option only.)
    '';
    homepage = "https://github.com/GloriousEggroll/proton-ge-custom";
    license = lib.licenses.bsd3;
    maintainers = [ lib.maintainers.amadejkastelic ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
})
