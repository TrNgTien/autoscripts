#!/bin/sh

# Add Docker's official GPG key:
echo "[Updating]"
sudo apt-get update

sudo apt-get install ca-certificates curl

sudo apt-get install htop

echo "[Installing] ZSH"

sudo apt install zsh

echo "[Installing] OH MY ZSH"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" -Y

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

echo "[INSTALLING] Docker"
sudo install -m 0755 -d /etc/apt/keyrings

sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "[DOCKER] verify docker run"
sudo docker run hello-world

echo "[INSTALLING] nvm"
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source ~/.zshrc


nvm -v

# Make source nvm can install node
sudo apt install libatomic1

nvm install v18.18.0

echo "[INSTALLING] zsh auto suggestion"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "[INSTALLING] zsh syntax highlighting plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
