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
  pushd src
  FILES=(cv resume)
  for file in "${FILES[@]}"; do
    echo "Compiling '$file' file to directory $DESTINATION_DIRECTORY"
    pdflatex $file.tex
    rm -rf $DESTINATION_DIRECTORY/$file.log
  done
  popd
}

function main() {
  check_requirements
  build
}

main
