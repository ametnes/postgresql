# https://github.com/bitnami/containers/tree/main/bitnami/postgresql
# https://access.crunchydata.com/documentation/pg_cron/1.3.1/
FROM bitnami/postgresql:16-debian-12 as builder
USER root

RUN apt-get update \
    && apt-get install git build-essential -y
WORKDIR /home
RUN git clone --branch v0.4.4 https://github.com/pgvector/pgvector.git
WORKDIR /home/pgvector
RUN make && make install

WORKDIR /home
RUN git clone https://github.com/citusdata/pg_cron.git
WORKDIR /home/pg_cron
RUN make && make install

# add to postgresql.conf:
# shared_preload_libraries = 'pg_cron'
# cron.database_name = 'postgres'
FROM bitnami/postgresql:16-debian-12
COPY --from=builder /opt/bitnami/postgresql/lib/*.so /opt/bitnami/postgresql/lib/
COPY --from=builder /opt/bitnami/postgresql/share/extension /opt/bitnami/postgresql/share/extension

USER 1001
