#!/bin/bash
psql -h $DB_URL -U $DB_USER -tc "SELECT 1 FROM pg_database WHERE datname = 'nodejs_demo'" | grep -q 1 | psql -h $DB_URL -U $DB_USER --dbname postgres -c "CREATE DATABASE nodejs_demo"
psql -h $DB_URL -U $DB_USER --dbname nodejs_demo < createTable.sql
