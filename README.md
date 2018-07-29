# remote-terminal

![]()

As customer facing engineers, many times we find ourselves working on various remote machines (without the usual GUIs) to troubleshoot client issues, setup and demo our products and manage dedicated servers such as continuous integration and production access. The following list is makes me feel at home on any remote machine. My usual set is a Mac laptop connected to remote Linux machines. Once I started working and crystallizing thoughts for this guide, I became more effective with terminal on my own local machine :). In general I try to work and test locally as much as possible.


## login and terminal - ssh
### login
```
ssh borisfarber@borisfarber.something-remote.com
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
Ability to modify files in the most important once connected to terminal and making basic bash commands. I was looking for the ditor that will be small, fast, extensible (open source), easy to pick up (as my main IDE is AndroidStudio/IntelliJ) and well documented. I found [tte](https://github.com/GrenderG/tte) and never looked back. It is just one C file!


## code search - ack
The next step after code (file) editing is code (text search). I checked grep but then found [ack](https://beyondgrep.com/install/) which is way more appealing. 

```
curl https://beyondgrep.com/ack-2.24-single-file > ./ack
sudo mv ack /usr/local/bin/
sudo chmod +x /usr/local/bin/ack
```











