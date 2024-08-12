#!/usr/bin/env bash
#
#  Installation script for Node
#
#  Example usage:
#
#         ./install-nodejs.sh ./node-v20.11.0-win-x64.zip
#

FILE=$(basename $1)
PRODUCT=$(echo "${FILE%.*}")
mkdir -p $PRODUCT
# # :: TMP_PATH=$(echo "$HOME/tools/nodejs/$PRODUCT/")
WIN_TMP_PATH=$(echo "$(pwd -W)")
TARGET_PATH=$(echo -en "${WIN_TMP_PATH}" | sed -e 's/\//\\\\/g')

echo "Preparing portable $PRODUCT"
echo "  Path: $TARGET_PATH"
unzip -o $1 -d $TARGET_PATH
echo "CURRENT_NODE=$PRODUCT" > "$HOME/tools/nodejs/current.sh"
echo "set CURRENT_NODE=$PRODUCT" > "$HOME/tools/nodejs/current.cmd"