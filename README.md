# Multi Streaming Server for Docker
A Dockerized Nginx server with RTMP module to send live video streams to multiple services simultaneously.

If you use Open Broadcast Software, I know it's possible to launch multiple instances, but it has a large CPU cost.

With this project, you can have only one stream to send and the Nginx RTMP server will dispatch this stream to every streaming services that you want. The only limit is your upload speed.

You also can re-encode your stream on the fly. If you want to stream to Youtube Gaming in 1080p at 60 FPS and on Twitch in 720p at 30 FPS, it's possible by changing the `ffmpeg` command variables in the Nginx configuration file.

## Prerequisites

You need software to stream to the Nginx server. I personally used [Open Broadcast Software](https://obsproject.com/).

If you want to use NVIDIA hardware accelerated encoding with a capable graphics card, you need to have the [nvidia-docker](https://github.com/NVIDIA/nvidia-docker) runtime installed.

## Usage
Rename the file **nginx.template.conf** (located into *nginx/conf/*) to **nginx.conf** and change its content with your specific data. For instance, you need to change **{{ youtube_key }}** by your Youtube stream key.

With OBS, change the RTMP URL to **rtmp://DOCKER_HOST_IP:1935/live**, you don't need to enter a stream key.

To check that the stream is properly received and sent to each services, you can browse to http://DOCKER_HOST_IP:8080/stat
### Basic Docker command
```docker run -v /path/to/nginx.conf:/usr/local/nginx/conf/nginx.conf -d -p 1935:1935 -p 8080:8080 lawtancool/multi-streaming-server```

### Using docker-compose (recommended)
You will need to have `docker-compose` installed on your host system.
Modify the included `docker-compose.yml` file to suit your needs, and run `docker-compose up -d` in the same directory as the `docker-compose.yml` file to run.

### Using docker-compose with stunnel
Nginx does not natively support RTMPS streaming (only RTMP), so to stream to services that require RTMPS (eg. Facebook, Instagram Live), rename `docker-compose.yml.stunnel` to `docker-compose.yml` and run `docker-compose up -d` to run both this container and a stunnel container together. Nginx will send its RTMP stream to stunnel to be converted to RTMP (see the Instagram config entry in `nginx.template.conf` as an example). More information can be found [here](https://www.jakobstoeck.de/2017/how-to-encrypt-rtmp-or-anything-really-over-ssl-tls/).

## FAQ

- [How to display all services' chat messages in the same place](https://github.com/Noxalus/Multi-Streaming-Server/wiki/How-to-display-all-services'-chat-messages-in-the-same-place)
- [How to handle new services](https://github.com/Noxalus/Multi-Streaming-Server/wiki/How-to-handle-new-services)
