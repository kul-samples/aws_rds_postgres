FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y nodejs npm
RUN apt-get install -y git
ENV DB_USER postgres
ENV DB_PWD pwd
ENV DB_URL thinknyx.cpqrk0kuf9qo.us-east-2.rds.amazonaws.com:5432
RUN git clone https://github.com/kul-samples/aws_rds_postgres.git /app
WORKDIR /app
RUN npm install
CMD ["node","app.js"]