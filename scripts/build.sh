#!/bin/bash

set -e

DESTINATION_DIRECTORY=$1

if [ -z $DESTINATION_DIRECTORY ]; then
    echo "Please provide a destination directory to copy files to."
    exit 1
fi

[ -d $DESTINATION_DIRECTORY/build ] || mkdir -p $DESTINATION_DIRECTORY/build

function build()
{
    FILES=(cv resume)

    cd src/
    
    for file in "${FILES[@]}"; do
    echo "Compiling LaTeX file $file to directory $DESTINATION_DIRECTORY"
	xelatex -output-directory=../$DESTINATION_DIRECTORY $file.tex
	rm -rf ../$DESTINATION_DIRECTORY/$file.log
    done
}

build
