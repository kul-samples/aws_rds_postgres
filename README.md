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

nodejs_demo=> \i createTable.sql
CREATE TABLE
nodejs_demo=> select * from employee;
 id | name | job | department | salary | hire_date
----+------+-----+------------+--------+-----------
(0 rows)

```
