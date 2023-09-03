#!/bin/bash
# Ce script installe les outils et les thèmes suivants :
# - bat          https://github.com/sharkdp/bat
# - micro        https://github.com/zyedidia/micro
# - exa          https://github.com/ogham/exa
# - fish         https://github.com/fish-shell/fish-shell
# - fisher       https://github.com/jorgebucaran/fisher
# - tide         https://github.com/IlanCosman/tide

echo "Installation du repository afin d'avoir la dernière version de fish"
sleep 2
sudo add-apt-repository ppa:fish-shell/release-3

echo
echo "\033[31mIl faut installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby) pour avoir les logos & cie\033[0m"
sleep 1.5
echo "\033[31mhttps://github.com/IlanCosman/tide#fonts\033[0m"
echo
sleep 3
echo

sudo apt-get -y update >/dev/null && sudo apt-get -y upgrade >/dev/null
if [ $? -eq 0 ]; then
  echo "Mise a jour reussie !"
else
  echo -e "\033[31mMise a jour echouee !\033[0m"
fi
sleep 1

# Installation de bat
echo
echo "Installation de bat."
sudo apt-get -y install bat >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de bat reussie !"
else
  echo -e "\033[31mInstallation de bat echouee !\033[0m"
fi
sleep 1

# Installation de micro
echo
echo "Installation de micro."
sudo apt-get -y install micro >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de micro reussie !"
else
  echo -e "\033[31mInstallation de micro echouee !\033[0m"
fi
sleep 1

# Installation de exa
echo
echo "Installation de exa."
sudo apt-get -y install exa >/dev/null
if [ $? -eq 0 ]; then
  echo "Installation de exa reussie !"
else
  echo -e "\033[31mInstallation de exa echouee !\033[0m"
fi
sleep 1


# Installation de fish
echo
echo "Installation de fish."
sudo apt-get -y install fish >/dev/null
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
#!/usr/bin/fish
# Installation de fisher (gestionnaire de plugins)
echo "Installation de fisher."
sleep 1
if curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
     echo "Installation de fisher reussie !"
else 
    set_color red; echo "Installation de fisher echouee !"
end
    set_color normal; echo 

sleep 2

# Installation du theme Tide
    echo "Installation du theme Tide."
sleep 1
if fisher install IlanCosman/tide@v5 
    echo "Installation du theme Tide reussi !"
else
    set_color red; echo "Installation du theme Tide echouee !"
end
    set_color normal; echo 

sleep 2

tide configure

# Mise en place de Fish comme shell par defaut
#echo "Mise en place de Fish comme shell par defaut."
#if chsh -s /usr/bin/fish
#    echo "La mise en place de Fish comme shell par defaut a reussie !"
#else
#    set_color red; echo "La mise en place de Fish comme shell par defaut a echouee !"
#end
#    set_color normal; echo 
#sleep 2

# Alias j'ai utiliser ceux de https://github.com/PAPAMICA/terminal/ car je les trouve explicite. (j'ai juste change bat pat batcat)

echo "Creation des alias"

################################# EXA #################################

function ls --description=""                    # Alias de la commande
    command exa -a --icons                      # ce que l'alias doit executer // command permet de rendre la fonction plus robuste car il garantit que "exa' est traité comme une commande externe
end                                             # Indique la fin de la fonction (alias)
funcsave ls                                     # Va enregistre la fonction ls en créant le fichier ~/.config/fish/functions/ls.fish pour que l'alias soit dispo au redémarrage ce qui le rend permanent


function ll --description="list un par ligne"
    command exa -1a --icons
end
funcsave ll


function ld --description="Comme ll"
    command ll
end
funcsave ld


function la --description="Liste avec info"
    command exa -lagh --icons
end
funcsave la


function lt --description="liste en arborescence level 2"
    command exa -a --tree --icons --level=2
end
funcsave lt


function ltf --description="Liste en arborescence"
    command exa -a --tree --icons
end
funcsave ltf


function lat --description="liste en arborescence avec info"
    command exa -lagh --tree --icons
end
funcsave lat


################################# BAT #################################

function cat --description=""
    command batcat --style="header" --pager "less -RF"
end
funcsave cat


function catn --description=""
    command batcat --pager "less -RF"
end
funcsave catn


function batn --description=""
    command batcat --pager "less -RF"
end
funcsave batn

################################# RACCOURCIS #################################

function nano --description="Remplace nano par micro"
    command micro
end
funcsave nano


function ipa --description="ip -c a"
    command ip -c a
end
funcsave ipa


function ipr --description="ip -c route"
    command ip -c route
end
funcsave ipr

function ipn --description="ip -c neigh"
    command ip -c neigh
end
funcsave ipn


# Recapitulatif
echo "Installation terminee."
sleep 1
EOF

chmod +x ./custom_fish.sh

echo
echo
echo "Fish va maintenant se lancer, pour finir l'installation"
echo "Lance la commande suivante"
sleep 1
echo
echo "./custom_fish.sh"
sleep 3

# Lancement de fish
echo "Lancement de fish."
sudo -u $(basename $(pwd)) fish