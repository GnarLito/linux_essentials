#! /bin/bash

install() {
	apt install neovim &> /dev/null
}

check() {
	which nvim &> /dev/null
}

load() {
	if check; then exit 0; fi

	install
	if [[ $? -ne 0 ]]
	then
		echo "Script needs to be run as Root!"
		exit 1;
	fi
	if check; then exit 0; fi
	exit 1
}




"$@"
