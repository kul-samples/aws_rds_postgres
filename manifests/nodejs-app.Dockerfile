FROM ubuntu:21.04
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && apt-get install -y nodejs npm
RUN apt-get install -y git
RUN adduser appuser --home /opt/appuser
USER appuser
ARG branch=main
RUN git clone --branch=${branch}  https://github.com/kul-samples/sample-nodejs-postgres.git /opt/appuser/app
WORKDIR /opt/appuser/app
RUN npm install
EXPOSE 4000
ENV DB_URL db
ENV DB_USER postgres
ENV DB_PWD mysecret
CMD ["node","app.js"]
