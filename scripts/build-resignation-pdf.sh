#!/bin/bash

set -e

CURRENT_MANAGER=$1
COMPANY=$2
END_DATE=$3
WHY=$4

function check_requirements() {
  if [[ -z "$CURRENT_MANAGER" ]]; then
    echo "Please pass an argument for 'CURRENT_MANAGER'"
    exit 1
  elif [[ -z "$COMPANY" ]]; then
    echo "Please pass an argument for 'COMPANY'"
    exit 1
  elif [[ -z "$END_DATE" ]]; then
    echo "Please pass an argument for 'END_DATE'"
    exit 1
  elif [[ -z "$WHY" ]]; then
    echo "Please pass an argument for 'WHY'"
    exit 1
  fi
}

function main() {
  check_requirements

  cp -f resignation.tex new-resignation.tex

  sed -i "s/%{CURRENT_MANAGER}%/${CURRENT_MANAGER}/g" new-resignation.tex
  sed -i "s/%{COMPANY}%/${COMPANY}/g" new-resignation.tex
  sed -i "s/%{END_DATE}%/${END_DATE}/g" new-resignation.tex
  sed -i "s/%{WHY}%/${WHY}/g" new-resignation.tex
	
  ./scripts/build.sh "new-resignation"

  rm -rf new-resignation.tex
  mv new-resignation.pdf resignation.pdf
}

main


