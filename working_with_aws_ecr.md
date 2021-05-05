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
### Push Image to AWS ECR
- retag image created before as per AWS ECR naming convention & then the push the image using `docker image push`
```
ubuntu@ip-172-31-23-246:~/sample-nodejs-postgres$ docker image tag sample-app:1.0 554660509057.dkr.ecr.us-east-2.amazonaws.com/sample-app:1.0

ubuntu@ip-172-31-23-246:~/sample-nodejs-postgres$ docker image ls
REPOSITORY                                                TAG       IMAGE ID       CREATED          SIZE
554660509057.dkr.ecr.us-east-2.amazonaws.com/sample-app   1.0       7bbf9379dca5   55 minutes ago   667MB
sample-app                                                1.0       7bbf9379dca5   55 minutes ago   667MB
ubuntu                                                    latest    7e0aa2d69a15   11 days ago      72.7MB

ubuntu@ip-172-31-23-246:~/sample-nodejs-postgres$ docker image push 554660509057.dkr.ecr.us-east-2.amazonaws.com/sample-app:1.0
The push refers to repository [554660509057.dkr.ecr.us-east-2.amazonaws.com/sample-app]
3b5abf50811f: Pushed
e00b20382f92: Pushed
e869905ebfec: Pushed
83cf146821db: Pushed
38f168c2293e: Pushed
2f140462f3bc: Pushed
63c99163f472: Pushed
ccdbb80308cc: Pushed
1.0: digest: sha256:e56854fd4e9afb6fa56e4992c6fc8bb17fb71900649b82b87ea0a76a8d3af0c3 size: 2000
```
