#run this file from your bashrc or add it to the bottom of it

export SYNC_MB="/path/to/repo1"
export SYNC_MF="/path/to/repo2"
export SYNC_P="/path/to/repo3"

export WEATHER='wttr.in/Oslo?0'		  #Shows the weather - pretty, if occasionally somewhat slow. 

alias ls='eza --icons --ignore-glob=XYZ*' #here XYZ was used to ignore a series of different filetypes all starting with the same characters


welcome () {
	clear
	curl $WEATHER
	echo ''
	ls
	echo ''	
}

update_weather () {
	clear && curl $WEATHER
	
}

godev () {
	clear
	echo ' '
	cd $1
	echo ' '
	#pwd
	ls
	echo ' '
	git status
}

dev () {

	if [ $1 = "p" ] || [ $1 = "plugin" ]
	then
		l=$SYNC_P
	fi

	if [ $1 = "m" ] || [ $1 = "mb" ] || [ $1 = "middleware" ]
	then
		l=$SYNC_MB
	fi

	if [ $1 = "f" ] || [ $1 = "mf" ] || [ $1 = "frontend" ] || [ $1 = "sso" ]
	then
		l=$SYNC_MF
	fi
					
	godev $l
}

sso () { # Quickly runs a localhost sso server
	start chrome --profile-directory=Default  
	# It's quicker for me to make sure that I open the chrome profile that has 
	# auto-login set up first before the sso popup shows up. This isn't neccesary for most people.
	cd $SYNC_MF
	npm start
}

