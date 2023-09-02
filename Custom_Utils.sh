#!/bin/bash
# Ce script installe les outils et les thèmes suivants :
# - bat
# - micro
# - exa
# - fish
# - fisher
# - tide

echo "Il faut commencer par installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby)"
echo "https://github.com/IlanCosman/tide#fonts"

#pause de 5 secondes
sleep 5

# Verification des droits d'administration
if [ "$EUID" -ne 0 ]
  then echo "Ce script doit etre execute en tant qu'administrateur (avec sudo)." 
  exit
fi

# Ajout du repository pour installer fish et mise a jour
echo "Ajout du repository pour installer fish et mise a jour."
sudo apt-add-repository ppa:fish-shell/release-3 >/dev/null
if [ $? -eq 0 ]; then
  echo "Ajout du repository reussie."
else
  echo "Ajout du repository echouee."
fi
sudo apt -y update && sudo apt -y upgrade >/dev/null
if [ $? -eq 0 ]; then
  echo "mise a jour reussie."
else
  echo "mise a jour echouee."
fi

# Installation de bat
echo "Installation de bat."
sudo apt -y install bat >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de bat reussie."
else
  echo "Installation de bat echouee."
fi

# Installation de micro
echo "Installation de micro."
sudo apt -y install micro >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de micro reussie."
else
  echo "Installation de micro echouee."
fi

# Installation de exa
echo "Installation de exa."
sudo apt -y install exa >/dev/null

# Installation de fish
echo "Installation de fish."
sudo apt -y install fish  >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de exa reussie."
else
  echo "Installation de exa echouee."
fi

# Lancement de fish
echo "Lancement de fish."
fish

# Installation de fisher (gestionnaire de plugins)
echo "Installation de fisher."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de fisher reussie."
else
  echo "Installation de fisher echouee."
fi

# Installation du theme Tide
echo "Installation du theme Tide."
fisher install IlanCosman/tide@v5 >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation du theme Tide reussi."
else
  echo "Installation du theme Tide echouee."
fi

# Mise en place de Fish comme shell par defaut
echo "Mise en place de Fish comme shell par defaut."
chsh -s /usr/bin/fish >/dev/null
if [ $? -eq 0 ]; then
  echo "Mise en place de Fish comme shell par defaut a reussie."
else
  echo "Mise en place de Fish comme shell par defaut a echouee."
fi

# Recapitulatif
echo "Installation terminee."
sleep 5