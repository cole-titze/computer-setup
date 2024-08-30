#!/bin/bash
docker stop odds-getter
docker rm odds-getter
docker pull ghcr.io/cole-titze/nhl-bookmaker-odds-getter:latest
docker run --name odds-getter --env-file ~/secrets/.env-vegas-getter -d ghcr.io/cole-titze/nhl-bookmaker-odds-getter:latest
