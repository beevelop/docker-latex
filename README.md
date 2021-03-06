[![Travis](https://shields.beevelop.com/travis/beevelop/docker-latex.svg?style=flat-square)](https://travis-ci.org/beevelop/docker-latex)
[![Pulls](https://shields.beevelop.com/docker/pulls/beevelop/latex.svg?style=flat-square)](https://links.beevelop.com/d-latex)
[![Size](https://shields.beevelop.com/docker/image/size/beevelop/latex/latest.svg?style=flat-square)](https://links.beevelop.com/d-latex)
[![Layers](https://shields.beevelop.com/docker/image/layers/beevelop/latex/latest.svg?style=flat-square)](https://links.beevelop.com/d-latex)

# Docker with LaTeX (incl. Biber & Glossaries)

> Simple image to automate LaTeX processing (e.g. for CI/CD stuff)

This images runs `pdflatex` with [texfot](https://www.ctan.org/pkg/texfot) (to filter clutter from the output) once, optionally `Biber` and `makeglossaries`, `pdflatex` twice again and optionally cleans up.


## Configuration (ENVs)
- `ENABLE_BIBER`: set to `true` to execute `biber "$@"` (default: disabled)
- `ENABLE_GLOSSARIES`: set to `true` to run `makeglossaries "$@"` (default: disabled)
- `ENABLE_CLEANUP`: set to `true` to clean up temporary files (default: disabled)
  - Warning: deletes `*.{aux,log,out,bbl,blg,acn,acr,alg,run.xml,toc,lot,lof,ist,idx,glo,glg,gls,bcf}`! Use with caution.

## Usage
```bash
# Assuming you main file is called "main.tex"
$ docker run --rm -v `pwd`:/mnt/src beevelop/latex main

# With Biber and Glossaries
$ docker run --rm -e ENABLE_BIBER=true -e ENABLE_GLOSSARIES=true -v `pwd`:/mnt/src beevelop/latex main
```

- Shortcut function for bash

```bash
docker-latex() { docker run -e ENABLE_BIBER=true -e ENABLE_GLOSSARIES=true -v $PWD:/mnt/src --rm  beevelop/latex:latest $@; return $?; }
```

add the function to your `.bash_rc`, `.bash_profile` or `.zshenv`

## Credit
> This repo / image is a fork of @soleo's original LaTeX image (see [soleo/docker-latex](https://github.com/soleo/docker-latex)) adapted for my personal use cases and requirements (Biber, Glossaries,...).
