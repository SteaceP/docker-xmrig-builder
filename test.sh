#!/bin/bash

docker stop xmrig-builder
docker rm xmrig-builder
docker build . -t xmrig-builder
docker run -d -e TZ="Canada/Toronto" -e SOURCE="https://github.com/lnxd/xmrig.git" --name="xmrig-builder" xmrig-builder
docker logs xmrig-builder -f
