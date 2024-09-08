#!/bin/bash
docker stop magic-mirror
docker rm magic-mirror
docker pull ghcr.io/cole-titze/containers/magic-mirror:latest
docker run --name magic-mirror -p 8082:8082 --restart=always -d ghcr.io/cole-titze/containers/magic-mirror:latest
