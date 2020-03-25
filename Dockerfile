FROM nvidia/cuda:10.2-runtime-ubuntu16.04

COPY . /docker/

WORKDIR /docker

RUN chmod +x docker-build.sh && ./docker-build.sh

RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/nginx/logs/error.log

CMD ["nginx", "-g", "daemon off;"]
