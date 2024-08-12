#!/usr/bin/env bash
#
#  Installation script for R language
#
#  Example usage:
#
#         ./install-r.sh ./R-4.3.2-win.exe
#

PRODUCT="main"
mkdir -p "$PRODUCT/rstudio"
TMP_PATH=$(readlink -f "$HOME/tools/r/$PRODUCT/rstudio")

echo 'Preparing portable RStudio'

echo '  Running setup...'
unzip -o $1 -d $TMP_PATH
