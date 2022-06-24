# install chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# install vim 
choco install vim

# install fzf
choco install fzf

# install ripgrep
choco install ripgrep

# install git
choco install git

#install tldr
choco install tldr

# allow running scripts like ps1
Set-ExecutionPolicy RemoteSigned

# install oh my posh for powershell
winget install JanDeDobbeleer.OhMyPosh
