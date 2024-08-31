#!/bin/bash
docker stop -t 300 esphome
docker rm esphome
docker pull ghcr.io/esphome/esphome
docker run -d --name esphome --restart=always -p 6052:6052 -p 6123:6123 -v /var/esphome/config:/config esphome/esphome