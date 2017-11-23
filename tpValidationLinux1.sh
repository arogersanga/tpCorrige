
installerVirtualBox ()
{
	echo "Installation de virtualBox:";
	echo "telechargement de virtualBox";
	wget -q http://download.virtualbox.org/virtualbox/debian/sun_vbox.asc -O- | sudo apt-key add; 
	echo "installation va commencer : ";
	sudo apt-get install VirtualBox
}
installerVagrantFile ()
{
	echo "Installation : "
	if [ ! -f Vagrantfile ]; then	    		
		vagrant init 
    		echo "Le fichier Vagrantfile a été généré !"
	else
    		echo "Un Vagrantfile existe déjà dans ce dossier !"
	fi
	
	echo "Veuillez choisir votre box:"
	echo -e "\t 1. xenial64"
	echo -e "\t 2. trusty64"
	
	while read box;
	do
		if [ $box = "1" ]; then
			#on remplace base par xenial64
			sed -i -e 's/base/xenial64/g' Vagrantfile
			echo "xenial64 créé";
			vagrant up
		elif [ $box = "xenial64" ]; then
                        #on remplace base par xenial64
                        sed -i -e 's/base/xenial64/g' Vagrantfile
                        echo "xenial64 créé";
			vagrant up
		elif [ $box = "2" ];then
			 #on remplace base par trusty64
                        sed -i -e 's/base/trusty64/g' Vagrantfile
                        echo "trusty64 créé";
			vagrant up			
		elif [ $box = "trusty64" ]; then
			#on remplace base par trusty64
			sed -i -e 's/base/trusty64/g' Vagrantfile
			echo "trusty64 créé";
			vagrant up			
		else
			rm Vagrantfile
			echo "choix incorrect: tapez 1 ou 2 ou xenial64 ou trusty64"
		fi

	done
}


#installer le Virtual box
installerVirtualBox
#installer Vagrantfile
installerVagrantFile 

