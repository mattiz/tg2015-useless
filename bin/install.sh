#!/bin/bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

#alias ls='$SCRIPT_PATH/clippy.sh "What is seen, cannot be unseen. Are you sure you want to do it?"; echo -n "[yes/no]: "; read i; if [ "$i" = "yes" ]; then echo ""; ls; fi'

#alias rm='$SCRIPT_PATH/clippy.sh "This is a really scary command. Are you sure you want to do it?"; echo -n "[yes/no]: "; read i; if [ "$i" = "yes" ]; then echo ""; ls; fi'



#function error_handler {
#	echo "foooo"
#}
#
#trap 'error_handler' ERR 



command_not_found_handle () {
	$SCRIPT_PATH/clippy.sh "Command not found: $1 Deal with it!";
}


function question () {
	$SCRIPT_PATH/clippy.sh "$1";

	echo -n "[yes/no]: ";
	read i;

	if [ "$i" = "yes" ]; then
		echo "";
		$2
	fi
}


function ls () {
	question "What is seen, cannot be unseen. Are you sure you want to do it?" "/bin/ls $@"
}


function rm () {
	question "This is a really scary command. Are you sure you want to do it?" "/bin/rm $@"
}