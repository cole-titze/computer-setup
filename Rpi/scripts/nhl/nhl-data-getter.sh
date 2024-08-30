#!/bin/bash
docker stop data-getter
docker rm data-getter
docker pull ghcr.io/cole-titze/nhl-data-getter:latest
docker run --name data-getter --env-file ~/secrets/.env-data-getter -d ghcr.io/cole-titze/nhl-data-getter:latest
