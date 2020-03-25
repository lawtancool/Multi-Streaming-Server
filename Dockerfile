FROM nvidia/cuda:10.2-runtime-ubuntu16.04

RUN docker-build.sh

COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
