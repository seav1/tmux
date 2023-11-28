#!/bin/bash

# Download and extract tmux, libevent, and ncurses
curl -sSL https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz | tar -xzvf -
curl -sSL https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz | tar -xzvf -
curl -sSL https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz | tar -xzvf -

# Configure, compile, and install libevent
cd libevent-2.1.11-stable
./configure --prefix="$HOME/tmux_depend" --disable-shared
make && make install
cd ..

# Configure, compile, and install ncurses
cd ncurses-6.2
./configure --prefix="$HOME/tmux_depend"
make && make install
cd ..

# Configure, compile, and install tmux
cd tmux-3.2
./configure CFLAGS="-I$HOME/tmux_depend/include -I/$HOME/tmux_depend/include/ncurses" LDFLAGS="-L/$HOME/tmux_depend/lib -L/$HOME/tmux_depend/include/ncurses -L/$HOME/tmux_depend/include"
make
cp tmux "$HOME/tmux_depend/bin"
cd ..

# Add tmux installation directory to PATH
echo 'export PATH="$HOME/tmux_depend/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
