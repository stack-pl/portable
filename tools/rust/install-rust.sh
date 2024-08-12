#!/usr/bin/env bash
#
#  Installation script for Rust language
#
#  Example usage:
#
#         ./install-rust.sh ./rustup-init.exe
#

PRODUCT="main"
mkdir -p "$PRODUCT/.cargo" "$PRODUCT/.rust"
TMP_PATH=$(readlink -f "$HOME/tools/rust/$PRODUCT/")

export CARGO_HOME=$(echo "$TMP_PATH/.cargo")
export RUSTUP_HOME=$(echo "$TMP_PATH/.rust")

echo 'Preparing portable Rust'
echo "  Cargo: $CARGO_HOME"
echo "  Rustup:  $RUSTUP_HOME"
eval "$1 -y --no-modify-path"

echo "CURRENT_RUST=$PRODUCT" > "$HOME/tools/rust/current.sh"
echo "set CURRENT_RUST=$PRODUCT" > "$HOME\tools\rust\current.cmd"
