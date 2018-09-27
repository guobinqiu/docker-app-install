FROM daocloud.io/library/mysql:latest
ENV MYSQL_ROOT_PASSWORD 111111
COPY migrate.sh /docker-entrypoint-initdb.d/
COPY seed.sql /data/
