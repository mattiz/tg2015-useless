#!/bin/bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


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


alias cd='question "Dont get lost in the file system. Wouldent you rather go home?" "cd"'