# 💡 Script pour personnaliser son Terminal

## 🤔 Je viens de créer un script à lancer en post installation de serveur Linux

Alors pourquoi ne pas vous en faire profiter ?  
Pour le moment je l'ai uniquement tester sur Ubuntu server mais cela devrais fonction sur la version Desktop d'Ubuntu ainsi que les version clients et serveurs de Debian.   
Cela m'a aprris à manipuler le bash et ce de façon pluôt utile je pense, ça peut être bien d'avoir un preset pour chacune de ses machines.  
------------------

## 📦 Utilitaires installés par le script  

* [Bat](https://github.com/sharkdp/bat)  
* [Micro](https://github.com/zyedidia/micro)  
* [Exa](https://github.com/ogham/exa)  
* [Intelligent standby list cleaner (ISLC)](https://www.wagnardsoft.com/content/Intelligent-standby-list-cleaner-ISLC-v1029-Released)  
* [Fish](https://github.com/fish-shell/fish-shell)  
* [Fisher](https://github.com/jorgebucaran/fisher)  
* [Tide](https://github.com/IlanCosman/tide)  

------------------

## ⚙️ Installation et présentation du script 

Avant toute chose, mettez vous dans votre répertoire avant de vous lancer dans l'installation du script.  
Faite simplement cd dans votre terminal.  
Lancer le script en copiant une des deux commandes si vous avez curl passez par **curl** sinon passez par **wget**.  
**Avec curl**  
```
Commande a venir car le telechargement modifie mon script  
```
**Avec wget**  
```
Commande a venir cale telechargement modifie mon script  
```
Dans un premier temps le script ajoute le repository afin d'avoir la derniere version de fish.  
Ensuite il met a jours notre machine puis passe à l'instalaltion de utilitaite sité plus haut.    

Dans un deuxième temps ce cript en créer un autre afin de lancer l'autre script via fish car il utilise un autre bash pour installer les pluins et themes.  
Deplus cela permet de pouvoir configurer les preset de notre fish car j'ai lancer la commande pour ça configuration intiale.  
Pas de panique la commande à tapé et super simple et elle sera indiqué dans votre terminal.  
La voici si besoin.
```
./custom_fish.sh  
```
Une fois la configuration de Fish fini le script créer des fonctions qui servent d'alias au commandes notamment pour exa et micro.   
C'est fini !   ✌️(•‿•)  

## 📄 Inspirration  et Documentations  

Au début j'avais vu l'article de [Tech2tech](https://www.tech2tech.fr/mon-terminal-ideal/#Shell) et je voulais donc partir sur zsh avec [Powerlevel10K](https://github.com/romkatv/powerlevel10k)  
Je l'ai tester ça fonctionnais bien, mais le fais de devoir installer des pluggins pour des fonctions déjà présentes sur Fish Shell à fait pencher la balance.  
L'avantage de zhs est qu'il ya une plus grande communautée et donc plus d'aide disponible pluggins, themes ...  
Si vous êtes interessé par zsh vous pouver lire l'article si dessus ou bien vous rendre sur son [repository](https://github.com/PAPAMICA/terminal).  
Etant pas un dev mais juste un passionné j'ai eu pas mal de difficultés que j'ai su surmonter grâce aux différents Github ,documentations et forums ainsi que l'aide de Google Bard et ChatGPT.  

* [LinuxHint](https://linuxhint.com/install_fish_shell_linux/) Car le repository d'Ubuntu n'as pas la dernière version de Fish et ça possais des soucis pour l'installation de Fisher  
* [DeveloperLife](https://developerlife.com/2021/01/19/fish-scripting-manual/) Pour m'aider à comprendre la syntaxe de Fish.  
* [Fishshell](https://fishshell.com/docs/current/index.html) le site officiel pour apréhender au mieux Fish.  
* [AskUbuntu](https://askubuntu.com) Pour me documenter et comprendre mes problèmes.  
* [StackOverflow](https://stackoverflow.com/questions)Pour me documenter et comprendre mes problèmes.  
* [Dev.to](https://dev.to/) Toujours pour mieux comprendre les soucis que j'ai rencontré.  
* [Le Github de Fish](https://github.com/fish-shell/fish-shell/issues/) Pour voir et comprendre comment les gens on résolue ou non des problème similaire auxquels j'ai été confrontés.  
* [ChatGPT](https://chat.openai.com) Pour vérifier mon script notament les petite erreur de syntaxe et pour voir si je pouvais compater mon code.  
* [Google Bard](https://bard.google.com) Pour vérifier mon script notament les petite erreur de syntaxe et pour voir si je pouvais compater mon code.  

J'aurais pu le compacter d'avantage, notamment en compactant l'installation de tout les paquets en une seule commande, mais pour le moment je trouve ma façon de faire plus explicite pour moi.  

------------------

## 👍 Recommandations

[Bibliothèque_de_commandes_Linux](https://linuxcommandlibrary.com/) Pour avoir un mémo des commandes linux sous la mains il existe une version sous Android ou iOS également.
[Micro_thèmes](https://github.com/zyedidia/micro/blob/master/runtime/help/colors.md) Pour changer le thème de micro personnement j'utlise dudekedark-tc.
[Tutoriaux](https://fishshell.com/docs/current/tutorial.html) Liste de tuto fait pas les dev de Fish
