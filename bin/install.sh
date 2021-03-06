#!/bin/bash

SCRIPT_PATH=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )


export PS1="\[$(tput bold)\]\[$(tput setaf 3)\]Clippy Bash\[$(tput setaf 7)\] $ \[$(tput sgr0)\]"


command_not_found_handle () {
	$SCRIPT_PATH/clippy.sh "Whoopsy Daisy! There don't seem to be any command like: *$1*";
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
	question "This is so destructive. Wouldn't you prefer a nice game of chess?" "chess" "/bin/rm $@"
}


function chess () {
	echo "║♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜"
	echo "║♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟"
	echo "║…  …  …  …  …  …  …  …"
	echo "║…  …  …  …  …  …  …  …"
	echo "║…  …  …  …  …  …  …  …"
	echo "║…  …  ♘  …  …  …  …  …"
	echo "║♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙"
	echo "║♖  …  ♗  ♕  ♔  ♗  ♘  ♖"
	echo "╚══════════════════════"
}


function ps () {
	say "It's rude to snoop in other peoples processes. I can't in good conscience let you do that."
}


function ping () {
	say "*PONG*"
}


function cat () {
	echo ""
	echo "  /\ ___ /\\"
 	echo " (  o   o  )"
	echo "  \  >#<  /  meaw!"
	echo "  /       \\"
	echo " /         \\       ^"
	echo "|           |     //"
	echo " \         /    //"
	echo "  ///  ///   --"
	echo ""
}


function sleep () {
	say "Zzzzzzzz....."
}


function kill () {
	question "What's with all the violence? Are you sure you want to kill that innocent process?" "/bin/kill $@"
}


function killall () {
	question "Mass murder, ey? Entering Dahmer mode." "/usr/bin/killall $@"
}


function tg () {
	say "ARNE!"
}


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