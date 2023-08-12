# Add last-pass extension after download
winget install Mozilla.Firefox
winget install Nvidia.GeForceExperience
winget install Valve.Steam
winget install Microsoft.VisualStudioCode
winget install Microsoft.AzureDataStudio
winget install Microsoft.VisualStudio.2022.Community
winget install Git.Git
# Go through githubs adding ssh key tutorial
winget install JetBrains.PyCharm.Community
winget install Spotify.Spotify
winget install Python.Python.3

# Add git config
git config --global user.email "cole.titze@outlook.com"
git config --global user.name "Cole"

# Not working
winget install Apple.iTunes
winget install LogMeIn.LastPass

winget upgrade --all
