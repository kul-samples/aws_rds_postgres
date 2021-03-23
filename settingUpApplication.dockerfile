FROM ubuntu:runtimes
WORKDIR /opt
RUN git clone https://github.com/kul-azure-demo/nodejs-pgsql.git app/
RUN cd app && npm install
WORKDIR /opt/app
ENV DB_USER demo
ENV DB_HOST demo
ENV DB_PWD demo
CMD ["node","app.js"]
