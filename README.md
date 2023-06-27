# docker-gcc

Dockerfile for development with gcc, intended for development in c and c++

## Description

Designed for development with Devcontainer or via CLI Docker commands to bind-mount source code.

### Base image

[debian:bullseye-slim](https://hub.docker.com/_/debian)

### Additional packages

- build-essential(gcc, g++, make, etc.)
- clangd
- gdb
- git

> **Note**
> In addition, [my dotfiles](https://github.com/s3igo/dotfiles) are included in the layers of the image.

## Usage

Build image

```shell
docker build -t s3igo/gcc .
```

Run container

```shell
docker run --rm -it s3igo/gcc
```

## Example

> **Note**
> In the following, the `$` prompt represents the host shell,
> the `#` prompt represents the container shell,
> and the `>` symbol represents the VS Code command palette.

### Using with CLI

1. Start container  
`$ docker compose -f example/.devcontainer/compose.yaml run --rm gcc`

2. Compile and run the C source code with gcc  
`# gcc hello.c -o hello && ./hello`

### Using with Devcontainer

1. Open the example project in VS Code  
`$ code example`

2. Select `Reopen in Container` from the command palette  
`> Dev Containers: Reopen in Container`

3. Open and run the VS Code terminal or use the Code Runner extension  
`# gcc hello.c -o hello && ./hello` or `> Run Code`

This method allows using the clang-format with VS Code's clangd extension or debugging with gdb.
