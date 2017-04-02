#!/usr/bin/env bash

set -eax

cd /mnt/src

pdflatex --interaction nonstopmode "$@" || true
biber "$@"
pdflatex --interaction nonstopmode "$@" || true
pdflatex --interaction nonstopmode "$@" || true
rm -f *.{aux,log,out}
