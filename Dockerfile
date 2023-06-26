FROM gcc:12.2.0-bullseye

RUN apt update && apt install -y \
    doxygen \
    gdb \
    graphviz \
    && rm -rf /var/lib/apt/lists/*


ENTRYPOINT ["gcc-exec"]

WORKDIR /home
