#!/bin/sh

tmp_file="/tmp/moonlight-nightly.flatpak";

[ -e file ] && rm $tmp_file;

echo "Downloading nighly version"
echo "-----"
curl -L -o $tmp_file https://github.com/FrogTheFrog/com.moonlight_stream.Moonlight/releases/download/nightly/com.moonlight_stream.Moonlight.flatpak;
echo "-----"

echo "Uninstalling old flatpak version";
sudo flatpak uninstall com.moonlight_stream.Moonlight -y &> /dev/null; # Flatpak output breaks terminal :/

echo "Installing nightly flatpak version";
sudo flatpak install "$tmp_file" -y &> /dev/null; # Flatpak output breaks terminal :/

[ -e file ] && rm $tmp_file;
