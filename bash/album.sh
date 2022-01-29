#!/bin/bash
if [ "$#" = "0" ] #On vérifie si l'utilisateur a renseigné des arguments
then
	echo "Syntaxe : $0 theme" #On affiche la syntaxe requise
	exit 1 #On sort du programme
fi

if [ ! -e "$1" ] #On vérifie si le theme souhaité n'a pas déjà été recherché
then #Si ce n'est pas le cas
	mkdir "$1" #On créer un répertoire du nom du thème entré
	cd "$1" #On y rentre
	#On récupère le code source de la page WEB selectionnée
	wget -O "$1" https://www.freeimages.com/search/"$1" --user-agent="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0"

	grep src.*jpg "$1" > sortie"$1" #On récupère les lignes qui contiennent ...src...jpg...
	cut sortie"$1" -d \" -f 2 > sortie2$1 #On ne garde que les liens des images

	wget -i sortie2$1 #On télécharge les images stockées

	for n in `ls *jpg` #Pour chaque image téléchargée
	do
		convert "$n" -resize 300x200 "$n" #On modifie sa taille
	done

	convert *.jpg "$1.pdf" #On créé un album d'image
	
	for i in `ls`
	do
		if [[ ! $i =~ .*pdf$ ]]
		then
			rm $i
		fi
	done
else #S'il existe déjà
        echo "$1 existe déjà" #On prévient l'utilisateur
fi


