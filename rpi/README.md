# Initial Rpi Setup
+ See the ansible repo for easy setup

---

## Add LLM
+ The llama docker container will attempt to use a model in the following location: /var/llm-models/model.gguf
+ The directory is created through the setup scripts, so just move your model to the rpi's folder
```
scp <your-model.gguf> pi@deploypi:/var/llm-models/model.gguf
```

---

# Nhl Setup

- If you want to run the nhl project, use this section

## Add environment variables for each repo

- nhl-odds-web-backend

```
nano ~/secrets/.env-backend
```

- nhl-data-getter

```
nano ~/secrets/.env-data-getter
```

- nhl-data-cleaner

```
nano ~/secrets/.env-data-cleaner
```

- nhl-bookmaker-odds-getter

```
nano ~/secrets/.env-vegas-getter
```

- nhl-game-predictor

```
nano ~/secrets/.env-game-predictor
```

- nhl-log-loss-getter

```
nano ~/secrets/.env-log-loss-getter
```

## Add with crontab -e

```
# Nhl applications running four times a day
# 0 */6 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-vegas-odds-getter.sh

# Nhl applications: updating and running nightly
0 1 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-odds-web-backend.sh
0 1 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-odds-web-frontend.sh
0 2 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-data-getter.sh
0 3 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-data-cleaner.sh
0 4 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-bookmaker-odds-getter.sh
0 5 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-game-predictor.sh
0 6 * * * /bin/bash ~/computer-setup/rpi/scripts/nhl/nhl-log-loss-getter.sh
```

## Database Deployment

- This is not a polished process. Automating deploying mssql server to arm devices is not ideal, so most of this process is manual.
- Connect to deployment server and update password in command and run:

```
sudo docker pull mcr.microsoft.com/azure-sql-edge:latest
sudo docker run --restart=always --cap-add SYS_PTRACE -e 'ACCEPT_EULA=1' -e 'MSSQL_SA_PASSWORD=<YOUR PASSWORD>' -p 1433:1433 --name azuresqledge -d mcr.microsoft.com/azure-sql-edge
```

- Connect to the database from Azure Data Studio (server name is your pi's ip no port is needed)
- Run the database deploy script from the nhl-database repository
- Run the table deploy script from the nhl-database repository
- Run the team post-deploy script from the nhl-database repository
- TODO: Backup process
