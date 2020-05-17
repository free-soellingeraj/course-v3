#!/bin/bash

function custom_unzip {
    d=$(dirname "$@");
    unzip $@ -d $d;
    rm -rf $@;
}
export -f custom_unzip
find $1 -name "*.zip" -exec bash -c 'custom_unzip "$@"' bash {} \;
