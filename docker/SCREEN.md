# Screen util

Have you ever faced the situation where you perform a long-running task on a remote machine, and suddenly your connection drops, the SSH session is terminated, and your work is lost. Well, it has happened to all of us at some point, hasn’t it? Luckily, there is a utility called screen that allows us to resume the sessions.

### Introduction
Screen or GNU Screen is a terminal multiplexer. In other words, it means that you can start a screen session and then open any number of windows (virtual terminals) inside that session. Processes running in Screen will continue to run when their window is not visible even if you get disconnected.

### Install Linux Screen on Ubuntu and Debian
```
sudo apt update
sudo apt install screen
```

### Commands
- Create new screen
```
screen -L -S nameofscreen
```
- Check existed screens
```
screen -ls
```
- Reconnect to screen
```
screen -r [name_of_screen]
```