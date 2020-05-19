#! /bin/bash

# e.g. /bin/bash /course-v3/pipeline_scripts/rebuild_ravdess.sh "/course-v3/nbs/dl1/data/emotions/" "/ws/data/emotions/ravdess/" "/course-v3/pipeline_scripts/unzip_all.sh"

target_dir="$1ravdess_audio"
source_dir="$2"
unzip="$3"

echo "Rebuilding: $target_dir"
rm -rf "$target_dir"
mkdir -p "$target_dir"

echo "Moving files from $2 to $target_dir"
find "$2" -name "*.zip" -exec cp {} "$target_dir" \;

echo "Unzipping all archives in: $target_dir"
function custom_unzip {
    echo "Unzipping $1";
    d=$(basename "$1" | sed 's~.zip~~g');
    unzip $@ -d "$(dirname $1)/${d}";
    rm -rf $@;
}
export -f custom_unzip
find $1 -name "*.zip" -exec bash -c 'custom_unzip "$@"' bash {} \;