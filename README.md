[![Travis](https://shields.beevelop.com/travis/beevelop/docker-latex.svg?style=flat-square)](https://travis-ci.org/beevelop/docker-latex)
[![Pulls](https://shields.beevelop.com/docker/pulls/beevelop/latex.svg?style=flat-square)](https://links.beevelop.com/d-latex)
[![Size](https://shields.beevelop.com/docker/image/size/beevelop/latex/latest.svg?style=flat-square)](https://links.beevelop.com/d-latex)
[![Layers](https://shields.beevelop.com/docker/image/layers/beevelop/latex/latest.svg?style=flat-square)](https://links.beevelop.com/d-latex)

# Docker with LaTeX

> Simple image to automate LaTeX processing.

## Usage

- Build image

```shell
$ docker pull soleo/latex
``` 

- Compile LaTeX

```shell
# Assuming you main file is called "main.tex"
$ docker run --rm -v `pwd`:/mnt/src beevelop/latex main 
```

- Shortcut function for bash

```shell
docker-latex() { docker run -v $PWD:/mnt/src --rm  beevelop/latex:latest $@; return $?; }
```

add the function to your .bash_rc or .bash_profile

## Credit
> This repo / image is only a fork @soleo's original LaTeX image (https://github.com/soleo/docker-latex) adapted for my personal use cases and requirements (Biber,...).
