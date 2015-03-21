#!/bin/bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#alias ls='$SCRIPT_PATH/clippy.sh "What is seen, cannot be unseen. Are you sure you want to do it?"; echo -n "[yes/no]: "; read i; if [ "$i" = "yes" ]; then echo ""; ls; fi'

#alias rm='$SCRIPT_PATH/clippy.sh "This is a really scary command. Are you sure you want to do it?"; echo -n "[yes/no]: "; read i; if [ "$i" = "yes" ]; then echo ""; ls; fi'

function ls () {
	$SCRIPT_PATH/clippy.sh "What is seen, cannot be unseen. Are you sure you want to do it?";

	echo -n "[yes/no]: ";
	read i;

	if [ "$i" = "yes" ]; then
		echo "";
		/bin/ls "$@";
	fi
}


function rm () {
	$SCRIPT_PATH/clippy.sh "This is a really scary command. Are you sure you want to do it?";

	echo -n "[yes/no]: ";
	read i;

	if [ "$i" = "yes" ]; then
		echo "";
		/bin/rm "$@";
	fi
}