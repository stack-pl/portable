#!/usr/bin/env bash
#
#  Installation script for R language
#
#  Example usage:
#
#         ./install-r.sh ./R-4.3.2-win.exe
#

PRODUCT="main"
mkdir -p "$PRODUCT" "$PRODUCT/r_libs_user"
TMP_PATH=$(readlink -f "$HOME/tools/r/$PRODUCT/")

echo 'Preparing portable R'

echo '  Building INF file...'
echo "[Setup]" > "$HOME/tools/r/setup.inf"
echo "DisableProgramGroupPage=yes" >> "$HOME/tools/r/setup.inf"
# echo "Group=R" >> "$HOME/tools/r/setup.inf"
echo "NoIcons=1" >> "$HOME/tools/r/setup.inf"
echo "SetupType=user" >> "$HOME/tools/r/setup.inf"

echo '  Running setup...'

eval '$1 /SP- /VERYSILENT /NOICONS /DIR="expand:$PRODUCT\\r_app" /LOADINF=setup.inf'
# echo '$1 /SP- /SILENT /DIR=expand:{%PATH%}\My Program' /LOADINF=setup.inf'
echo "CURRENT_R=$PRODUCT" > "$HOME/tools/r/current.sh"
echo "set CURRENT_R=$PRODUCT" > "$HOME/tools/r/current.cmd"
