#!/bin/bash
docker stop odds-frontend
docker rm odds-frontend
docker pull ghcr.io/cole-titze/nhl-odds-web-frontend:latest
docker run --name odds-frontend -p 8081:8081 --restart=always -d ghcr.io/cole-titze/nhl-odds-web-frontend:latest
