# Start tmux notes

## Start when you shell into a system:
If you also want to start tmux when you log in over ssh, you'll have to launch it from your ~/.profile. Do this only if the parent process of the login shell is sshd:

``` bash
parent_process_name=$(ps -o comm= -p $PPID`)
case ${parent_process_name##*/} in
  sshd) type tmux >/dev/null 2>/dev/null && exec tmux;;
esac
```

## If this was on a remote system; _it's probably not_

``` bash
ssh -t hostname.example.com bin/tmux-login-session SESSION_NAME
```

## Connect to remote ssh that already has tmux

``` bash
ssh hostname.example.com -t tmux a
```
