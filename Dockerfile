FROM nvidia/cuda:10.2-runtime-ubuntu16.04

COPY . /docker/

WORKDIR /docker

RUN chmod +x docker-build.sh && ./docker-build.sh

RUN chmod +x docker-entrypoint.sh

CMD ["docker-entrypoint.sh"]
