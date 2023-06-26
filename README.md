# docker-gcc

Docker image for development with gcc, intended for development in c and c++

Provided image repository: [s3igo/gcc](https://hub.docker.com/r/s3igo/gcc)

## Description

Designed for development with Devcontainer or by bind-mounting source code on the command line.

### Base image

[debian:bullseye-slim](https://hub.docker.com/_/debian)

### Additional packages

- build-essential(gcc, g++, make, etc.)
- clangd
- gdb
- git

> **Note**
> In addition, [my dotfiles](https://github.com/s3igo/dotfiles) are included in the layers of the image.

## usage

### obtain image

```shell
# pull from Docker Hub
$ docker pull s3igo/gcc

# or build locally
$ cd docker-gcc
$ make
```

### compile and execute[^1]

```shell
# execute just once
$ docker run --rm -v "$(pwd):/home" s3igo/gcc input.c

# show detailed usage
$ docker run --rm s3igo/gcc -h
```

### generate documentation with [Doxygen](https://www.doxygen.nl/index.html)

```shell
$ docker run --rm -v "$(pwd):/home" s3igo/gcc

```

### attach to container

```shell
$ docker run --rm -it --entrypoint=bash -v "$(pwd):/home" s3igo/gcc
```

## example

```shell
$ docker compose -f example/.devcontainer/compose.yaml run --rm gcc

\# gcc hello.c -o hello && ./hello && rm hello
```

[^1]: For non-Mac, add `-u $(id -u):$(id -g)` to the docker run command options
