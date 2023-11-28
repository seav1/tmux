安装非root版tmux
```
wget -qO- https://github.com/tmux/tmux/releases/download/3.2/tmux-3.2.tar.gz | tar -xzvf -
wget -qO- https://github.com/libevent/libevent/releases/download/release-2.1.11-stable/libevent-2.1.11-stable.tar.gz | tar -xzvf -
wget -qO- https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz | tar -xzvf -
cd libevent-2.1.11-stable
./configure --prefix="$HOME/tmux_depend" --disable-shared
make  make install
cd
cd ncurses-6.2
./configure --prefix="$HOME/tmux_depend"
make  make install
cd
cd tmux-3.2
./configure CFLAGS="-I$HOME/tmux_depend/include -I/$HOME/tmux_depend/include/ncurses" LDFLAGS="-L/$HOME/tmux_depend/lib -L/$HOME/tmux_depend/include/ncurses -L/$HOME/tmux_depend/include"
make
cp tmux "$HOME/tmux_depend/bin"
cd
echo 'export PATH="$HOME/tmux_depend/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

1）新建会话，比如新创建一个会话以"myapp"命名
```
tmux new -s myapp
```
加上参数-d，表示在后台新建会话 
```
tmux new -s mayapp -d
```

2）查看创建得所有会话 
```
tmux ls
```

3）登录一个已知会话。即从终端环境进入会话。 
第一个参数a也可以写成attach。后面的myapp是会话名称。 
```
tmux a -t myapp
```

4）退出会话不是关闭： 
登到某一个会话后，先按键ctrl+b启动快捷键，再按d，这样就会退出该会话，但不会关闭会话。 
如果直接ctrl + d，就会在退出会话的通话也关闭了该会话！
 
5）关闭会话（销毁会话）
```
tmux kill-session -t myapp
```

6）重命名会话
```
tmux rename -t myapp newapp
```
