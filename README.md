# Effective Bash

![Remote Machine](https://github.com/borisf/effective-bash/blob/master/img/header.png)

As customer facing engineers, many times we find ourselves working on various remote machines (without the usual GUIs) to troubleshoot client issues, setup and demo our products and manage dedicated servers such as continuous integration and production access. The following list is makes me feel at home with every remote machine. My usual set is a Mac laptop connected to a remote Linux machine. Once I started working and crystallizing thoughts for this guide, I became more effective with terminal on my own local machine :). In general I try to work and test locally as much as possible.


## login and terminal - ssh

### config
Edit (or create) `~/.ssh/config` on the *local* machine and create the following entry:
```
Host remote remote-strong
  # Replace with your remote hostname.
  Hostname borisfarber.something-remote.com
  # Replace with the username you use on your remote.
  User borisfarber
  
  # Enable multiplexing (reusing the same SSH connection).
  ControlMaster auto
  ControlPath ~/.ssh/master-%r@%h:%p
  ControlPersist 10m
  
  # Prefer AES for good balance of speed and security.
  Ciphers aes128-gcm@openssh.com,aes256-gcm@openssh.com
  # Ensure legacy protocol is never used.
  Protocol 2
  # Disable password-based authentication.
  PreferredAuthentications publickey

Host remote
  # Use SSH protocol level keepalives instead of TCP level to reduce overhead.
  ServerAliveInterval 30
  ServerAliveCountMax 6
  TCPKeepAlive no
  # Enable compression.
  Compression yes

Host remote-strong
  TCPKeepAlive yes
  # On a strong connection, compression is unnecessary overhead.
  Compression no
```

### login
```
ssh remote
```

If your connection is strong (e.g. in the same local network):
```
ssh remote-strong
```

### secure copy
#### Folder
From the folder where XXXX is based (make sure that the Development directory exists)
```
scp -r XXXX borisfarber@borisfarber.something-remote.com:/home/Development
```

* -r for recursive
* Creates the XXXX folder in the remote machine

#### File
```
scp ~/Desktop/lf borisfarber@borisfarber.something-remote.com:/home/Development
```

## text editor - tte
Ability to modify files in the most important once connected to terminal and making basic bash commands. I was looking for an editor to be small, fast, extensible (open source), easy to pick up (as my main IDE is AndroidStudio/IntelliJ) and well documented. I found [tte](https://github.com/GrenderG/tte) and never looked back. It is just one C file!


## code search - ack
The next step after code (file) editing is code (text search). I checked grep, but then found [ack](https://beyondgrep.com/install/), which is way more appealing. 

```
curl https://beyondgrep.com/ack-2.24-single-file > ./ack
sudo mv ack /usr/local/bin/
sudo chmod +x /usr/local/bin/ack
```

## file manager - tree

![Tree](https://github.com/borisf/remote-terminal/blob/master/img/tree.png)

As part of my desktop flow I use a lot a dual pane file manager ([Norton Commander](https://en.wikipedia.org/wiki/Norton_Commander) derivative). I spend hours looking for something similar (and more advanced than ls command) for terminal, but was never happy. All programs either had a non trivial builds, not appealing looks, 100% CPU usage and more. I ended up using [tree](https://github.com/nodakai/tree-command).

Example of the second level tree
``` tree -L 2 ```
