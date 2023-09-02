#!/bin/bash
echo "Il faut commencer par installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby)"
echo "https://github.com/IlanCosman/tide#fonts"

sleep 5

# Vérifions que nous avons les droits d'administration
if [ "$EUID" -ne 0 ]; then
  echo "Ce script doit être exécuté en tant qu'administrateur (avec sudo)."
  exit
fi

# Ajout du repository pour installer fish et mise a jour
echo "Ajout du repository pour installer fish et mise a jour."
sudo apt-add-repository ppa:fish-shell/release-3 >dev/null
sudo apt -y update && sudo apt -y upgrade >dev/null

# Installation de bat
echo "Installation de bat."
sudo apt -y install bat >dev/null

# Installation de micro
echo "Installation de micro."
sudo apt -y install micro >dev/null

# Installation de exa
echo "Installation de exa."
sudo apt -y install exa >dev/null

# Installation de fish
echo "Installation de fish."
sudo apt -y install fish  >dev/null

# Lancement de fish
echo "Lancement de fish."
fish

# Installation de fisher (gestionnaire de plugins)
echo "Installation de fisher."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher >dev/null

# Installation du theme Tide
echo "Installation du theme Tide."
fisher install IlanCosman/tide@v5 >dev/null

# Mise en place de Fish comme shell par defaut
echo "Mise en place de Fish comme shell par defaut."
chsh -s /usr/bin/fish >dev/null

# Recapitulatif
echo "Installation terminée."
sleep 5
