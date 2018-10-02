# Effective Bash

![Remote Machine](https://github.com/borisf/effective-bash/blob/master/img/header.png)

As customer facing engineers, many times we work with various remote machines (without the usual GUIs) to troubleshoot client issues, setup and demo our products and manage dedicated servers such as continuous integration(CI) and production access. The following list is makes me feel at home on every remote machine.

As rule of thumb I try to minimize and be mindfull about my configs to make sure they work with every [posix](https://en.wikipedia.org/wiki/POSIX) compliant system.

My bash flow, is **search** (with bunch of tools) ==> **fix/edit** (with vi) ==> **commit** (with git). 


# Search

| Tool  | How to use |
| ------------- | ------------- |
| [hh](https://github.com/dvorka/hstr)  | Bash history suggest  |
| [ag](https://github.com/ggreer/the_silver_searcher)  | String search in folders  |
| [peco](https://github.com/peco/peco)  | Incremental String search in folders ```$ find . -name '*.java' -exec nl -s ': {}: '  {} \; | peco ``` |

I keep 2 windows, one with the editor and another with peco for incremental search.


# Edit - vi
There are more than enough table with vi's shortcuts, so I will skip it. I installed and happy with these 2 plugins:

* [Kotlin](https://github.com/udalov/kotlin-vim) - kotlin syntax coloring.

* [CntlP](https://github.com/ctrlpvim/ctrlp.vim) - fuzzy files opener.

Here is my [.vimrc](https://github.com/borisf/effective-bash/blob/master/dot-files/.vimrc).

# Commit - git

* Merge

* Side by side diff

* Lazygit


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

## prompt - powerline - go
For the shell prompt I use [powerline-go](https://github.com/justjanne/powerline-go) that showes not only nice look, but also git status.


Steps

1. Install Go 
2. [Install](https://medium.freecodecamp.org/jazz-up-your-bash-terminal-a-step-by-step-guide-with-pictures-80267554cb2) custom fonts on osx for iterm2
3. Install the powerline-go itself
```
// download and install
$ go get -u github.com/justjanne/powerline-go
$ go install github.com/justjanne/powerline-go
```
4. Update bash profile

.bash_profile update
```
function _update_ps1() {
      PS1="$(~/.go/bin/powerline-go -error $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND=_update_ps1
fi
```
