#! /bin/bash
# Il faut commencer par installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby) 
# https://github.com/IlanCosman/tide#fonts
#
# Ajout du repository pour installer fish 
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt -y update && sudo apt -y upgrade
# Installation de bat une alternative a cat qui implemente la couleur sytaxique et les numero de ligne
sudo apt -y install bat
# Installation de micro un editeur de text mieux que nano et il supporte la souris
sudo apy -y install micro
# Installation de exa un alternative a ls je vais creer les alias plus loins
sudo apt -y install exa
# Installation de fish ! un super remplacant de bash 
sudo apt install fish
# Intalaltion de fisher un gestionnaire de plugin pour fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
# Installation du theme Tide 
fisher install IlanCosman/tide@v5
# Mise en place de Fish comme shell par defaut
chsh -s /usr/bin/fish 