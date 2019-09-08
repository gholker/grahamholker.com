#!/bin/bash 
set -euo pipefail 
IFS=$'\n\t'

docker run \
    --rm \
    --name "hugo-gh-com" \
    -v $(pwd):/src \
    jguyomard/hugo-builder \
    hugo