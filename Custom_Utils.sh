#!/bin/bash
# Ce script installe les outils et les thèmes suivants :
# - bat          https://github.com/sharkdp/bat
# - micro        https://github.com/zyedidia/micro
# - exa          https://github.com/ogham/exa
# - fish         https://github.com/fish-shell/fish-shell
# - fisher       https://github.com/jorgebucaran/fisher
# - tide         https://github.com/IlanCosman/tide

# Couleurs pour les messages
cyan="\033[1;36m"
red="\033[1;31m"
reset="\033[0m"

# Fonction pour afficher un message de succès ou d'échec
function check_result {
  if [ $? -eq 0 ]; then
    echo -e "${cyan}$1 réussie !${reset}"
  else
    echo -e "${red}$1 échouée !${reset}"
  fi
}

# Liste des paquets à installer
packages=("bat" "micro" "exa" "fish")

# Ajout du repository Fish
  echo -e "${cyan}Installation du repository afin d'avoir la dernière version de Fish${reset}"
sleep 2
  sudo add-apt-repository ppa:fish-shell/release-3
  echo -e "\n\n\n\n"

# Precison pour meilleur rendu du terminal
  echo -e "${cyan}$1 Il faut installer les 4 polices d'ecriture MesloLGS NF et les utiliser dans notre terminal (Tabby) pour avoir les logos & cie${reset}"
sleep 1
  echo -e "${cyan}$1 https://github.com/IlanCosman/tide#fonts${reset}"
  echo -e "\n\n\n\n"
sleep 3

# Mise à jour du système 
  echo -e "${cyan}Mise à jour du système...${reset}"
  sudo apt-get -y update >/dev/null && sudo apt-get -y upgrade >/dev/null
  check_result "Mise à jour"
echo
sleep 1

# Installation des paquets
for package in "${packages[@]}"; do
  echo -e "${cyan}Installation de $package...${reset}"
  sudo apt-get -y install "$package" >/dev/null
  check_result "Installation de $package"
  echo -e "\n\n"
  sleep 1
done

# Generation du fichier custom_fish.sh
  echo -e "${cyan}Generation du fichier custom_fish.sh......${reset}"
sleep 2

cat << EOF > ./custom_fish.sh
#!/usr/bin/fish
# Installation de fisher (gestionnaire de plugins)
  set_color -o -u cyan; echo "Installation de fisher."
  set_color normal; echo
sleep 1
  if curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    set_color cyan; echo "Installation de fisher reussie !"
  else
    set_color red; echo "Installation de fisher echouee !"
  end
    set_color normal; echo

sleep 2

# Installation du theme Tide
    set_color cyan; echo "Installation du theme Tide......"
    set_color normal; echo
sleep 1
  if fisher install IlanCosman/tide@v5
    set_color cyan; echo "Installation du theme Tide reussi !"
  else
    set_color red; echo "Installation du theme Tide echouee !"
  end
    set_color normal; echo

sleep 2

tide configure

# Alias j'ai utiliser ceux de https://github.com/PAPAMICA/terminal/ car je les trouve explicite. (j'ai juste change bat pat batcat)

  set_color cyan; echo "Creation des alias"
  set_color normal; echo

################################# EXA #################################

  function ls --description=""                    # Alias de la commande
    command exa -a --icons \$argv                 # ce que l'alias doit executer // command permet de rendre la fonction plus robuste car il garantit que "exa' est traité comme une commande externe
                                                  # "argv" indique qu'on puisse utiliser des argument apres la commande \`avant arg permet qu'il soit pris en compte comme caractere
  end                                             # Indique la fin de la fonction (alias)
  funcsave ls                                     # Va enregistre la fonction ls en créant le fichier ~/.config/fish/functions/ls.fish pour que l'alias soit dispo au redémarrage ce qui le rend permanent

  function ll --description="list un par ligne"
    command exa -1a --icons \$argv
  end
  funcsave ll


  function ld --description="Comme ll"
    command ll \$argv
  end
  funcsave ld


  function la --description="Liste avec info"
    command exa -lagh --icons \$argv
  end
  funcsave la


  function lt --description="liste en arborescence level 2"
    command exa -a --tree --icons --level=2 \$argv
  end
  funcsave lt


  function ltf --description="Liste en arborescence"
    command exa -a --tree --icons \$argv
  end
  funcsave ltf


  function lat --description="liste en arborescence avec info"
    command exa -lagh --tree --icons \$argv
  end
  funcsave lat


################################# BAT #################################

  function cat --description=""
    command batcat --style="header" --pager "less -RF" \$argv
  end
  funcsave cat


  function catn --description=""
    command batcat --pager "less -RF" \$argv
  end
  funcsave catn


  function batn --description=""
    command batcat --pager "less -RF" \$argv
  end
  funcsave batn

################################# RACCOURCIS #################################

  function nano --description="Remplace nano par micro"
    command micro \$argv
  end
  funcsave nano


  function ipa --description="ip -c a"
    command ip -c a \$argv
  end
  funcsave ipa


  function ipr --description="ip -c route"
    command ip -c route \$argv
  end
  funcsave ipr

  function ipn --description="ip -c neigh"
    command ip -c neigh \$argv
  end
  funcsave ipn


# Recapitulatif
  set_color -o cyan; echo "Installation terminee."
EOF

sleep 1

  chmod +x ./custom_fish.sh

 echo -e "\n\n\n\n"

  echo -e "${cyan}Fish va maintenant se lancer, pour finir l'installation${reset}"
  echo -e "${cyan}Lance la commande suivante${reset}"

echo -e "\n\n\n\n"

sleep 1

  echo -e "${cyan}./custom_fish.sh${reset}"

echo -e "\n\n\n\n"
sleep 3

# Lancement de fish
  echo -e "${cyan}Lancement de fish.${reset}"
  sudo -u $(basename $(pwd)) fish