一键安装非root版tmux
```
bash <(wget -qO- https://raw.githubusercontent.com/seav1/tmux/main/tmux.sh)
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
第一个参数a也可以写成attach。后面的aaa是会话名称。 
```
tmux a -t myapp
```

4）退出会话不是关闭： 
登到某一个会话后，先按键ctrl+b启动快捷键，再按d，这样就会退出该会话，但不会关闭会话。 
如果直接ctrl + d，就会在退出会话的通话也关闭了该会话！
 
5）关闭会话（销毁会话）
```
tmux ls
```
```
tmux kill-session -t myapp
```

6）重命名会话
```
tmux rename -t myapp newapp
```
