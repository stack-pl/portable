#!/usr/bin/env bash
#
#  Installation script for python packages
#
#  Example usage:
#
#         ./install-python.sh ./python-3.12.0-amd64.exe
#

PRODUCT=$(echo $1 | grep -oP 'python-[0-9][.][0-9]+[.][0-9]+')
mkdir -p $PRODUCT
:: TMP_PATH=$(echo "$HOME/tools/python3/$PRODUCT/")
WIN_TMP_PATH=$(echo "$(pwd -W)/$PRODUCT/")
TARGET_PATH=$(echo -en "${WIN_TMP_PATH}" | sed -e 's/\//\\\\/g')

echo "Preparing portable $PRODUCT"
echo "  Path: $TARGET_PATH"
eval $1 InstallAllUsers=0 TargetDir=$TARGET_PATH AssociateFiles=0 Shortcuts=0 Include_launcher=0 Include_test=0 SimpleInstall=1
echo "CURRENT_PYTHON=$PRODUCT" > "$HOME/tools/python3/current.sh"
echo "set CURRENT_PYTHON=$PRODUCT" > "$HOME/tools/python3/current.cmd"