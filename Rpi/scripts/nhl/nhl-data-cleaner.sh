#!/bin/bash
docker stop data-cleaner
docker rm data-cleaner
docker pull ghcr.io/cole-titze/nhl-data-cleaner:latest
docker run --name data-cleaner --env-file ~/secrets/.env-data-cleaner -d ghcr.io/cole-titze/nhl-data-cleaner:latest