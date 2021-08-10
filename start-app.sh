#!/bin/bash
psql -h ${DB_URL} -U ${DB_USER} --dbname postgres < createDatabase.sql
psql -h ${DB_URL} -U ${DB_USER} --dbname nodejs_demo < createEmployeeTable.sql
node app.js
