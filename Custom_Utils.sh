#!/bin/bash
# Ce script installe les outils et les thèmes suivants :
# - bat
# - micro
# - exa
# - fish
# - fisher
# - tide

echo "Installation du repository afin d'avoir la dernière version de fish"
sleep 2
sudo add-apt-repository ppa:fish-shell/release-3

echo

echo "Il faut installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby) pour avoir les logos & cie"
sleep 1.5
echo "https://github.com/IlanCosman/tide#fonts"

echo

#pause de 3 secondes
sleep 3

# Verification des droits d'administration
if [ "$EUID" -ne 0 ]
  then echo "Ce script doit etre execute en tant qu'administrateur (avec sudo)." 
  exit
fi

echo
sudo apt-get -y update >/dev/null && sudo apt-get -y upgrade >/dev/null
if [ $? -eq 0 ]; then
  echo "mise a jour reussie !"
else
  echo -e "\033[31mmise a jour echouee !\033[0m"
fi
sleep 1

# Installation de bat
echo
echo "Installation de bat."
sudo apt-get -y install --assume-yes bat >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de bat reussie !"
else
  echo -e "\033[31mInstallation de bat echouee !\033[0m"
fi
sleep 1

# Installation de micro
echo
echo "Installation de micro."
sudo apt-get -y install --assume-yes micro >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de micro reussie !"
else
  echo -e "\033[31mInstallation de micro echouee !\033[0m"
fi
sleep 1

# Installation de exa
echo
echo "Installation de exa."
sudo apt-get -y install --assume-yes exa >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de exa reussie !"
else
  echo -e "\033[31mInstallation de exa echouee !\033[0m"
fi
sleep 1


# Installation de fish
echo
echo "Installation de fish."
sudo apt-get -y install --assume-yes fish  >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de fish reussie !"
else
  echo -e "\033[31mInstallation de fish echouee !\033[0m"
fi
sleep 2

# Generation du fichier custom_fish.sh
echo
echo
echo "Generation du fichier custom_fish.sh"
sleep 2

cat << EOF > ./custom_fish.sh

# Installation de fisher (gestionnaire de plugins)
echo "Installation de fisher."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher >/dev/null
  echo "Installation de fisher reussie !"
else
  echo -e "\033[31mInstallation de fisher echouee !\033[0m"
fi
sleep 1

# Installation du theme Tide
echo "Installation du theme Tide."
fisher install IlanCosman/tide@v5 
if [ $? -eq 0 ]; then
  echo "Installation du theme Tide reussi."
else
  echo -e "\033[31mInstallation du theme Tide echouee.\033[0m"
fi
sleep 1

# Mise en place de Fish comme shell par defaut
echo "Mise en place de Fish comme shell par defaut."
chsh -s /usr/bin/fish >/dev/null
if [ $? -eq 0 ]; then
  echo "Mise en place de Fish comme shell par defaut a reussie."
else
  echo -e "\033[31mMise en place de Fish comme shell par defaut a echouee.\033[0m"
fi
sleep 1

# Recapitulatif
echo "Installation terminee."
sleep 5

EOF

chmod +x ./custom_fish.sh

echo
echo
echo "Fish va maintenant se lancer, pour finir l'installation"
echo "lance la commande suivante"
sleep 1
echo
echo "sudo ./custom_fish.sh"
sleep 3

# Lancement de fish
echo "Lancement de fish."
sudo -u vince exec fish