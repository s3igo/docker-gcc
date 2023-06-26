FROM debian:bullseye-slim

# install dependencies
RUN apt update && apt install -y \
  build-essential \
  gdb \
  git \
  && rm -rf /var/lib/apt/lists/*

# install dotfiles
RUN git clone https://github.com/s3igo/dotfiles.git ~/.dotfiles \
  && ~/.dotfiles/scripts/link.sh
