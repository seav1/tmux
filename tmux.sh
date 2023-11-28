#!/bin/bash

# Download and extract tmux, libevent, and ncurses
wget -qO- https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz | tar -xzvf - >/dev/null 2>&1
wget -qO- https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz | tar -xzvf - >/dev/null 2>&1
wget -qO- https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz | tar -xzvf - >/dev/null 2>&1

# Configure, compile, and install libevent
cd libevent-2.1.11-stable >/dev/null 2>&1
./configure --prefix="$HOME/tmux_depend" --disable-shared >/dev/null 2>&1
make && make install >/dev/null 2>&1
cd >/dev/null 2>&1

# Configure, compile, and install ncurses
cd ncurses-6.2 >/dev/null 2>&1
./configure --prefix="$HOME/tmux_depend" >/dev/null 2>&1
make && make install >/dev/null 2>&1
cd >/dev/null 2>&1

# Configure, compile, and install tmux
cd tmux-3.2 >/dev/null 2>&1
./configure CFLAGS="-I$HOME/tmux_depend/include -I/$HOME/tmux_depend/include/ncurses" LDFLAGS="-L/$HOME/tmux_depend/lib -L/$HOME/tmux_depend/include/ncurses -L/$HOME/tmux_depend/include" >/dev/null 2>&1
make >/dev/null 2>&1
cp tmux "$HOME/tmux_depend/bin" >/dev/null 2>&1
cd >/dev/null 2>&1

# Add tmux installation directory to PATH
echo 'export PATH="$HOME/tmux_depend/bin:$PATH"' >> ~/.bashrc >/dev/null 2>&1
source ~/.bashrc >/dev/null 2>&1
