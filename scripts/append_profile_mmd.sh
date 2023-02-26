#! /bin/bash

profile_append() {
echo "
# Make Move directory
function mmd() {
	mkdir \$1
	cd \$1
}
" >> ~/.profile
}

check() {
	grep -Fq "function mmd() {" ~/.profile
}

load() {
	if check; then exit 0; fi

	profile_append

	if check; then exit 0; fi
	exit 1
}

"$@"
