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
### Login to ECR or Elastic Container Registry
- Create a IAM Role for EC2 Service using below policy and attach the role with your EC2 Server
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ecr:GetAuthorizationToken",
                "ecr:BatchCheckLayerAvailability",
                "ecr:GetDownloadUrlForLayer",
                "ecr:GetRepositoryPolicy",
                "ecr:DescribeRepositories",
                "ecr:ListImages",
                "ecr:DescribeImages",
                "ecr:BatchGetImage",
                "ecr:GetLifecyclePolicy",
                "ecr:GetLifecyclePolicyPreview",
                "ecr:ListTagsForResource",
                "ecr:DescribeImageScanFindings",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:PutImage"
            ],
            "Resource": "*"
        }
    ]
}
```
- Install AWS CLI and Login to ECR using Below commands
```
$ sudo apt-get update -y 
$ sudo apt-get install -y awscli
$ aws ecr get-login-password --region <aws-region> | docker login --username AWS --password-stdin <ecr-registry-url>

ubuntu@ip-172-31-23-246:~/sample-nodejs-postgres$ aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 554660509057.dkr.ecr.us-east-2.amazonaws.com
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```
