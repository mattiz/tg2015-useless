#!/bin/bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]Clippy Bash\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


command_not_found_handle () {
	$SCRIPT_PATH/clippy.sh "Command not found: $1 Deal with it!";
}


function say () {
	$SCRIPT_PATH/clippy.sh "$1";
}


function question () {
	$SCRIPT_PATH/clippy.sh "$1";

	echo -n "[yes/no]: ";
	read i;

	if [ "$i" = "yes" ]; then
		echo "";
		$2
	else
		$3
	fi
}


function ls () {
	question "What is seen, cannot be unseen. Are you sure you want to do it?" "/bin/ls $@"
}


function rm () {
	question "This is a really scary command. Are you sure you want to do it?" "/bin/rm $@"
}


alias cd='question "Dont get lost in the file system. Wouldent you rather go home?" "cd"'


function assistance () {
	clear
	say "Great! I have just improved Bash for you. Knock yoursself out!";
}


function no_assistance () {
	clear
	say "You must have pressed the wrong key. Don't worry, I will help you anyway!";
}


clear
question "Hi! I am Clippy, your bash assistant. Would you like some assistance today?" "assistance" "no_assistance"