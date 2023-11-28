#!/bin/bash

# Download and extract tmux, libevent, and ncurses
wget -qO- https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz | tar -xzvf - -C /usr/home/yzzfzd01/
wget -qO- https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz | tar -xzvf - -C /usr/home/yzzfzd01/
wget -qO- https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz | tar -xzvf - -C /usr/home/yzzfzd01/

# Configure, compile, and install libevent
cd /usr/home/yzzfzd01/libevent-2.1.11-stable
./configure --prefix="/usr/home/yzzfzd01/tmux_depend" --disable-shared
make && make install
cd /usr/home/yzzfzd01/

# Configure, compile, and install ncurses
cd /usr/home/yzzfzd01/ncurses-6.2
./configure --prefix="/usr/home/yzzfzd01/tmux_depend"
make && make install
cd /usr/home/yzzfzd01/

# Configure, compile, and install tmux
cd /usr/home/yzzfzd01/tmux-3.2
./configure CFLAGS="-I/usr/home/yzzfzd01/tmux_depend/include -I/usr/home/yzzfzd01/tmux_depend/include/ncurses" LDFLAGS="-L/usr/home/yzzfzd01/tmux_depend/lib -L/usr/home/yzzfzd01/tmux_depend/include/ncurses -L/usr/home/yzzfzd01/tmux_depend/include"
make
cp tmux "/usr/home/yzzfzd01/tmux_depend/bin"
cd /usr/home/yzzfzd01/

# Add tmux installation directory to PATH
echo 'export PATH="/usr/home/yzzfzd01/tmux_depend/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
