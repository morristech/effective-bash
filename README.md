# Effective Bash

![Remote Machine](https://github.com/borisf/effective-bash/blob/master/img/header.png)

As customer facing engineers, many times we work with various remote machines (without the usual GUIs) to troubleshoot client issues, setup and demo our products and manage dedicated servers such as continuous integration(CI) and production access. The following list is makes me feel at home on every remote machine.

My bash flow, is search (bunch of tools) ==> fix/edit with vi ==> commit (git). 


# Search

| Tool  | How to use |
| ------------- | ------------- |
| [hh](https://github.com/dvorka/hstr)  | Bash history suggest  |
| [ag](https://github.com/ggreer/the_silver_searcher)  | String search in folders  |
| [peco](https://github.com/peco/peco)  | Incremental String search in folders ```$ find . -name '*.java' -exec nl -s ': {}: '  {} \; | peco```|

I use peco with find all the time.


# Edit - vi
There are more than enough table with vi's shortcuts, so I will skip it.
Will list my custom configs/plugins:

* Java

* Kotlin

* CntlP

# Commit - git

## Merge

## Side by side diff


# Misc.


## login - ssh

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
Ability to modify files in the most important once connected to terminal and making basic bash commands. If youa re looking for an editor to be small, fast, extensible (open source), easy to pick up  I recommend [tte](https://github.com/GrenderG/tte).

## prompt - powerline
Will fill out ...
