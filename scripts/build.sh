#!/bin/bash

set -e

DESTINATION_DIRECTORY=build

function check_requirements() {
  if [[ -z "$DESTINATION_DIRECTORY" ]]; then
    echo "Please provide a destination directory to copy files to."
    exit 1
  fi
}

function build()
{
  FILES=(cv resume)
  for file in "${FILES[@]}"; do
    echo "Compiling '$file' file to directory $DESTINATION_DIRECTORY"
    xetex -output-directory=$DESTINATION_DIRECTORY $file.tex
    rm -rf $DESTINATION_DIRECTORY/$file.log
  done
}

function main() {
  check_requirements
  build
}

main
