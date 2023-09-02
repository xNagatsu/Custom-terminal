#!/bin/bash
# Il faut commencer par installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby) 
# https://github.com/IlanCosman/tide#fonts

# Ajout du repository pour installer fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt -y update && sudo apt -y upgrade

# Installation de bat
sudo apt -y install bat

# Installation de micro
sudo apt -y install micro

# Installation de exa
sudo apt -y install exa

# Installation de fish
sudo apt -y install fish

# Installation de fisher (gestionnaire de plugins)
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Installation du theme Tide
fisher install IlanCosman/tide@v5

# Mise en place de Fish comme shell par defaut
chsh -s /usr/bin/fish

# Recapitulatif
echo "Installation terminee."