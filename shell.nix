let
  pkgs = import <nixpkgs> { };
  nightly-rust = pkgs.latest.rustChannels.nightly.rust.override {
    targets = [ "wasm32-unknown-unknown" "x86_64-unknown-linux-gnu" ];
  };
in pkgs.mkShell {
  buildInputs = [
    nightly-rust
    pkgs.cargo-generate
    pkgs.nodejs
    pkgs.wasm-pack
  ];
  RUST_BACKTRACE = 1;
}
