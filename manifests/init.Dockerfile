FROM kulbhushanmayer/ubuntu:psql
COPY database-setup.sh .
COPY create-table.sql .
ENV DB_URL=localhost
ENV DB_USER=postgres
ENV PGPASSWORD=india123
CMD ["sh","database-setup.sh"]
