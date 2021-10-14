FROM kulbhushanmayer/ubuntu:psql
COPY database-setup.sh .
COPY createTable.sql .
ENV DB_URL=localhost
ENV DB_USER=postgres
ENV PGPASSWORD=india123
CMD ["sh","database-setup.sh"]
