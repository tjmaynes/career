#!/bin/bash

set -e

function main() {
  FILES=(cv resume)
  for file in "${FILES[@]}"; do
    echo "Compiling '$file' file..."
    xelatex $file.tex
    rm -rf $file.log
  done
}

main
