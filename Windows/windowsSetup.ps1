# Add last-pass extension after download and disable firefox pwd manager 
winget install Mozilla.Firefox
winget install Nvidia.GeForceExperience
winget install Valve.Steam
winget install Microsoft.VisualStudioCode
winget install Microsoft.AzureDataStudio
# Add .NET under modify of the installer
winget install Microsoft.VisualStudio.2022.Community
winget install Git.Git
# Go through githubs adding ssh key tutorial
winget install JetBrains.PyCharm.Community
winget install Spotify.Spotify
winget install Python3

# Add git config
git config --global user.email "cole.titze@outlook.com"
git config --global user.name "Cole"

# Not working
winget install Apple.iTunes
winget install LogMeIn.LastPass

winget upgrade --all

# Get repos
git clone git@github.com:cole-titze/nhl-data-getter.git
git clone git@github.com:cole-titze/nhl-data-cleaner.git
git clone git@github.com:cole-titze/nhl-odds-web-backend.git
git clone git@github.com:cole-titze/nhl-odds-web-frontend.git
git clone git@github.com:cole-titze/nhl-game-predictor.git
git clone git@github.com:cole-titze/nhl-log-loss-getter.git
