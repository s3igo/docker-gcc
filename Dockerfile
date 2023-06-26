FROM debian:bullseye-slim

RUN apt update && apt install -y \
    build-essential \
    gdb \
    git \
    && rm -rf /var/lib/apt/lists/*


# ENTRYPOINT ["gcc-exec"]

# WORKDIR /home
