#!/usr/bin/env bash

set -eax

cd /mnt/src

pdflatex --interaction nonstopmode "$@"

# Optionally run Biber and Glossaries
[ -z "$ENABLE_BIBER" ] && biber "$@"
[ -z "$ENABLE_GLOSSARIES" ] && makeglossaries "$@"

pdflatex --interaction nonstopmode "$@"
pdflatex --interaction nonstopmode "$@"

# Clean up temporary files
rm -f *.{aux,log,out}
