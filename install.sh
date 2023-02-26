#! /bin/bash



load_script() {
         output=$(bash $1 load)
	 if [ $? -eq 0 ]
	 then
		 printf "    - Loaded: ${1##*/}\n" 
	 else
		 printf "    \033[0;31m- Failed\033[0m: ${1##*/} %-15s- $output\n"
	 fi
}

load_scripts() {
	printf "Loading all scripts from ($1)\n"
	for FILE in $1/*.sh; do 
		load_script $FILE &
		jobs[$!]=$!
	done

	for PID in ${jobs[*]}; do
		wait $PID
	done
}

load_scripts "/opt/linux_essentials/scripts"
printf "\nAll scripts loaded, please reload the profile file:

    source ~/.profile

"
