#!/bin/bash
docker stop log-loss-getter
docker rm log-loss-getter
docker pull ghcr.io/cole-titze/nhl-log-loss-getter:latest
docker run --name log-loss-getter --env-file ~/secrets/.env-log-loss-getter -d ghcr.io/cole-titze/nhl-log-loss-getter:latest