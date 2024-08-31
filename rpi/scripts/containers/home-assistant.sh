#!/bin/bash
docker stop -t 600 home-assistant
docker rm home-assistant
docker pull homeassistant/raspberrypi4-homeassistant:latest
docker run -d --name home-assistant --restart=always --device /dev/ttyUSB0:/dev/ttyUSB0 -v /var/homeassistant:/config --network host homeassistant/raspberrypi4-homeassistant