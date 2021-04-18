### Setup Postgres Client
- `sudo apt-get update -y`
- `sudo apt-get install postgresql-client-12 -y`
- `psql --version`
### Create Sample DB for Demo
```
ubuntu@ip-10-10-10-4:~$ psql -h <postgres_db_endpoint> -U <db_admin_user> -W --dbname postgres
Password: <db_admin_pwd>
psql (12.6 (Ubuntu 12.6-0ubuntu0.20.04.1), server 12.5)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=>

postgres=> create database nodejs_demo;
CREATE DATABASE
postgres=> \l
                                   List of databases
    Name     |  Owner   | Encoding |   Collate   |    Ctype    |   Access privileges
-------------+----------+----------+-------------+-------------+-----------------------
 demo        | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 nodejs_demo | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 postgres    | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 |
 rdsadmin    | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 | rdsadmin=CTc/rdsadmin
 template0   | rdsadmin | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/rdsadmin          +
             |          |          |             |             | rdsadmin=CTc/rdsadmin
 template1   | postgres | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
             |          |          |             |             | postgres=CTc/postgres
(6 rows)

postgres=> \c nodejs_demo
Password:
psql (12.6 (Ubuntu 12.6-0ubuntu0.20.04.1), server 12.5)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
You are now connected to database "nodejs_demo" as user "postgres".
nodejs_demo=>

nodejs_demo=> \i createEmployeeTable.sql
CREATE TABLE
nodejs_demo=> select * from employee;
 id | name | job | department | salary | hire_date
----+------+-----+------------+--------+-----------
(0 rows)

```
### Running Sample Application on Ubuntu 20.04
```
$ sudo apt-get update -y
$ sudo apt-get install -y nodejs npm
$ git clone https://github.com/kul-samples/aws_rds_postgres.git
$ cd aws_rds_postgres

ubuntu@ip-10-10-10-4:~/aws$ npm install
added 71 packages from 47 contributors and audited 71 packages in 2.017s
found 0 vulnerabilities

# update postgres connection string in routes/employees.js

ubuntu@ip-10-10-10-4:~/aws$ node app.js
Server is running.. on Port 4000

# Ensure in AWS Security Group port 4000 is open for public access or minimum to your laptop IPs
```
### Steps to Install Docker on Ubuntu 20.04
```
$ sudo apt-get update -y
$ sudo apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
$ sudo apt-get update -y
$ sudo apt-get install docker-ce docker-ce-cli containerd.io -y
$ sudo chown ubuntu:users /var/run/docker.sock
$ docker version
```
### Create Image for the Application
- `docker image build -t sample-app:latest -f Dockerfile .`
### Run Container using above image
- `docker container run -d --name sample-app -e "DB_PWD=admin123" -p 4000:4000 sample-app:latest`
### Docker Image Link - https://hub.docker.com/repository/docker/kulbhushanmayer/sample-app
