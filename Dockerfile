FROM postgres:16.1
ENV TZ="America/Bogota"
COPY *.sql /docker-entrypoint-initdb.d/
EXPOSE 5432