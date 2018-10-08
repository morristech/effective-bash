# Effective Bash

![Remote Machine](https://github.com/borisf/effective-bash/blob/master/img/header.png)

As customer facing engineers, many times we work with various remote machines (without the usual GUIs) to troubleshoot client issues, setup and demo our products and manage dedicated servers such as continuous integration(CI) and production access. The following list is makes me feel at home on every remote machine.

As rule of thumb I try to minimize and be mindfull about my configs to make sure they work with every [posix](https://en.wikipedia.org/wiki/POSIX) compliant system.

# :telescope: Search - [fzf](https://github.com/junegunn/fzf)

Start by searching the relevant code/log data.  
* [fd](https://github.com/sharkdp/fd) with [fzf](https://github.com/junegunn/fzf) - incremental String search in folders ==> ``` fd -e java -x nl -s ': {/.}: ' {} | fzf --reverse ```
* [fzf](https://github.com/junegunn/fzf) with [bat](https://github.com/sharkdp/bat) - incremental files search with file content preview ==> ``` fzf --preview 'bat --color always {}' ```



# :pencil2: Edit - vi

Once I find the relevant place I change/fix the code.

This is the [book](https://upload.wikimedia.org/wikipedia/commons/d/d2/Learning_the_vi_Editor.pdf) I learnt vi from. The advantage of the book it is short and explains everything, one needs to be productive with vi. vi's out of the box experince is good to my needs, thus I ended up with these 2 easy install plugins:

* [CtrlP](https://github.com/ctrlpvim/ctrlp.vim) - fuzzy files opener.

* [Kotlin](https://github.com/udalov/kotlin-vim) - Kotlin syntax coloring

Here is my [.vimrc](https://github.com/borisf/effective-bash/blob/master/dot-files/.vimrc) file

# :file_folder: Commit - git

Fix is ready, time to commit.

* [Fac](https://github.com/mkchoi212/fac) - terminal UI for merge

* [lazygit](https://github.com/jesseduffield/lazygit) - terminal git ui


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
Ability to modify files in the most important once connected to terminal and making basic bash commands. If you are looking for an editor to be small, fast, extensible (open source), easy to pick up  I recommend [tte](https://github.com/GrenderG/tte).

## prompt - powerline - go
For the shell prompt I use [powerline-go](https://github.com/justjanne/powerline-go) that showes not only nice look, but also git status.


Steps

1. Install [Go](https://golang.org/doc/install) 
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
