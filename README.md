## Chrome with Extension Dockerfile


This repository contains **Dockerfile** of [Chrome](https://www.google.com/chrome/browser/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/ghilead/chrome/).


### Base Docker Image

* [dockerfile/ubuntu-desktop](http://dockerfile.github.io/#/ubuntu-desktop)


### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/ghilead/chrome/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull ghilead/chrome`

   (alternatively, you can build an image from Dockerfile: `docker build -t="ghilead/chrome" github.com/ghilead/chrome`)


### Usage

    boot2docker init
    boot2docker up
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    docker run -it --rm -p 5901:5901 ghilead/chrome


Connect to `vnc://<host>:5901` via VNC client.
