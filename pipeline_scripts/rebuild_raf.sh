#!/bin/bash

# E.g. /bin/bash "pipeline_scripts/rebuild_raf.sh" "pipeline_scripts/unzip_all.sh" "/ws/data/emotions/RAF_Face_Database_basic/" "$(pwd)"

unzip="$1"
data_source="$2"
data_dest="$3"

echo "Removing existing data source in target: $data_source"
rm -rf "$data_dest/$(basename $data_source)"

echo "Copying: $data_source to $data_dest"
cp -r "$data_source" "$data_dest"

echo "Applying script: $unzip"
find . -d -exec /bin/bash $unzip {} \;