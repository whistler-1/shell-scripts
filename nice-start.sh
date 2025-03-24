#run this file in your bashrc

export BACKEND="/long/path/to/project"
export WEATHER='wttr.in/Oslo?0'		  #Shows the weather - pretty, if occasionally somewhat slow. 

alias ls='eza --icons --ignore-glob=XYZ*' #here XYZ was used to ignore a series of different filetypes all starting with the same characters

welcome () {
	clear
	curl $WEATHER
	echo ''
	ls
	echo ''	
}

backend () {
	clear
	echo ''
	cd $BACKEND
	pwd
	git status
	ls
	echo ''
}

welcome
