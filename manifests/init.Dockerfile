FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y postgresql-client
COPY createTable.sql .
