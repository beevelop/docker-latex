#!/usr/bin/env bash

set -eax

cd /mnt/src

texfot pdflatex --interaction nonstopmode "$@"

# Optionally run Biber and Glossaries
[ -v ENABLE_BIBER ] && biber "$@"
[ -v ENABLE_GLOSSARIES ] && makeglossaries "$@"

texfot pdflatex --interaction nonstopmode "$@"
texfot pdflatex --interaction nonstopmode "$@"

# Clean up temporary files
[ -v ENABLE_CLEANUP ] && rm -f *.{aux,log,out,bbl,blg,acn,acr,alg,run.xml,toc,lot,lof,ist,idx,glo,glg,gls,bcf}
