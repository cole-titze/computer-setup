#!/bin/bash
docker stop -t 600 llm-web-backend
docker rm llm-web-backend
docker pull ghcr.io/cole-titze/containers/llm-web-backend:latest
docker run -d --name=llm-web-backend  --restart=always --volume=/var/llm-models:/llm/models --memory=5.5GB --cpus=3.33 --publish=8083:8083 ghcr.io/cole-titze/containers/llm-web-backend:latest