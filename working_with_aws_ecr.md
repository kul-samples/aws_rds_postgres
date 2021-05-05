### Installing Docker on EC2
- Create and EC2 Ubuntu Server using AWS Console or AWS CLI and Login to the Same and Install Docker Engine using below commands
```
$ #!/bin/bash
$ sudo apt-get update -y
$ sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update -y
$ sudo apt-get install docker-ce docker-ce-cli containerd.io -y
$ sudo chown ubuntu:users /var/run/docker.sock
$ docker version
```
- Steps to create Docker Image, Clone the repo on the Ubuntu Server created and perform the commands as below
```
$ cd ~
$ git clone https://github.com/kul-samples/sample-nodejs-postgres.git
$ cd sample-nodejs-postgres/
$ docker image build -t sample-app:1.0 -f Dockerfile .
$ docker image ls
```
