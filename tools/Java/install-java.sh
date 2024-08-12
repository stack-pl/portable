#!/usr/bin/env bash
#
#  Installation script for JDK
#
#  Example usage:
#
#         ./install-java.sh ./openjdk-21.0.1_windows-x64_bin.zip
#

PRODUCT=$(echo $1 | grep -oP 'jdk-[0-9]+[.][0-9]+[.][0-9]+')
mkdir -p $PRODUCT
# :: TMP_PATH=$(echo "$HOME/tools/java/$PRODUCT/")
WIN_TMP_PATH=$(echo "$(pwd -W)")
TARGET_PATH=$(echo -en "${WIN_TMP_PATH}" | sed -e 's/\//\\\\/g')

echo "Preparing portable $PRODUCT"
echo "  Path: $TARGET_PATH"
unzip -o $1 -d $TARGET_PATH
echo "CURRENT_JDK=$PRODUCT" > "$HOME/tools/java/current.sh"
echo "set CURRENT_JDK=$PRODUCT" > "$HOME/tools/java/current.cmd"