#!/usr/bin/env bash
cd /mnt/src

exec pdflatex --interaction nonstopmode "$@" && \
exec biber "$@" && \
exec pdflatex --interaction nonstopmode "$@" && \
exec pdflatex --interaction nonstopmode "$@" && \
rm -f *.{aux,log,out}
