{
  lib,
  stdenv,
  fetchFromGitHub,
  rustPlatform,
  makeWrapper,
  perf,
  nix-update-script,
}:

rustPlatform.buildRustPackage rec {
  pname = "cargo-flamegraph";
  version = "0.6.7";

  src = fetchFromGitHub {
    owner = "flamegraph-rs";
    repo = "flamegraph";
    rev = "v${version}";
    sha256 = "sha256-OpneGyulSreUKhmnLfsJ2sEbkDPCcrDjkRu9ccKZcJc=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-uErlNPkacAmURNKAZp1wLsV2NB1w9HfjLZl5PgeMRu0=";

  nativeBuildInputs = lib.optionals stdenv.hostPlatform.isLinux [ makeWrapper ];

  postFixup = lib.optionalString stdenv.hostPlatform.isLinux ''
    wrapProgram $out/bin/cargo-flamegraph \
      --set-default PERF ${perf}/bin/perf
    wrapProgram $out/bin/flamegraph \
      --set-default PERF ${perf}/bin/perf
  '';

  passthru.updateScript = nix-update-script { };

  meta = with lib; {
    description = "Easy flamegraphs for Rust projects and everything else, without Perl or pipes <3";
    homepage = "https://github.com/flamegraph-rs/flamegraph";
    license = with licenses; [
      asl20 # or
      mit
    ];
    maintainers = with maintainers; [
      killercup
      matthiasbeyer
    ];
  };
}
