#!/bin/bash
docker stop game-predictor
docker rm game-predictor
docker pull ghcr.io/cole-titze/nhl-game-predictor:latest
docker run --name game-predictor --env-file ~/secrets/.env-game-predictor -d ghcr.io/cole-titze/nhl-game-predictor:latest