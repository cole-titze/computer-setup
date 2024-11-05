# Add icloud from MS store
winget install Mozilla.Firefox
winget install Discord.Discord
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

winget upgrade --all

# Test getting repos
git clone git@github.com:cole-titze/nhl-odds.git
