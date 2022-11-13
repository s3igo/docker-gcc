# docker-gcc

Docker image of gcc for C/C++ development

## detail

### base image

- [gcc](https://hub.docker.com/_/gcc):12.2.0-bullseye

### additional packages

- doxygen: 1.9.1
- gdb: 10.1.90
- graphviz: 2.43.0

### entrypoint

- [gcc-exec](./gcc-exec.sh)

### deliverables repository

- [s3igo/gcc](https://hub.docker.com/r/s3igo/gcc)

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

# attach to container
$ docker run --rm -it --entrypoint=bash -v "$(pwd):/home" s3igo/gcc

# show detailed usage
$ docker run --rm s3igo/gcc -h
```

[^1]: For non-Mac, add `-u $(id -u):$(id -g)` to the docker run command options
