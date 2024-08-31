docker image prune -a -f
docker system prune --volumes -f
docker stop -t 600 $(docker ps -a -q)
sleep 30
sudo apt-get update -y && sudo apt-get upgrade -y
sudo reboot