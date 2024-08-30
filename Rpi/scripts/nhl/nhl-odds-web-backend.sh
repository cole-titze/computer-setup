#!/bin/bash
docker stop odds-backend
docker rm odds-backend
docker pull ghcr.io/cole-titze/nhl-odds-web-backend:latest
docker run --name odds-backend --env-file ~/secrets/.env-backend -p 8080:80 --restart=always -d ghcr.io/cole-titze/nhl-odds-web-backend:latest