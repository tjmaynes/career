#!/bin/bash

set -e

function main() {
  if [[ -z "$FILE" ]]; then
    echo "Please pass an argument for 'FILE'"
    exit 1
  fi

  echo "Compiling '$FILE' file..."

  xelatex $FILE.tex

  rm -rf $FILE.log $FILE.aux $FILE.out
}

main
