#! /bin/bash

# e.g. /bin/bash "/course-v3/pipeline_scripts/download_ravdess.sh" "/ws/data/emotions/ravdess_audio/"

target_dir=$1
rm -rf $target_dir
mkdir -p $target_dir
wget "https://zenodo.org/record/1188976/files/Audio_Speech_Actors_01-24.zip?download=1" -O "${target_dir}Audio_Speech_Actors_01-24.zip"
wget "https://zenodo.org/record/1188976/files/Audio_Song_Actors_01-24.zip?download=1" -O "${target_dir}Audio_Song_Actors_01-24.zip"