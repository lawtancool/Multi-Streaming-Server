FROM nvidia/cuda:10.2-runtime-ubuntu16.04

COPY ./* .

RUN docker-build.sh

RUN chmod +x docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
