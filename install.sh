#! /bin/bash


load_scripts() {
	echo "Loading all scripts from ($1)"
	for FILE in $1/*.sh; do 
		 bash $FILE load
		 if [ $? -eq 0 ]
		 then
			 echo -e "    - Loaded: ${FILE##*/}"
		 else
			 echo -e "    \033[0;31m- Failed\033[0m: ${FILE##*/}"
		fi
	 done
}

load_scripts "/opt/linux_essentials/scripts"
echo -e "\nAll scripts loaded, please reload the profile file:
	
	. ~/.profile

"
