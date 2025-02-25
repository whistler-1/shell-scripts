export BACKEND="/long/path/to/project"

cd_backend () {
	  cd $BACKEND
	  ls
	  git status
}

alias ls='eza --icons --ignore-glob=XYZ*' #here XYZ was used to ignore a series of different filetypes all starting with the same characters
alias weather='curl wttr.in/?0'           #Shows the weather - pretty and convenient, if occasionally slow. 

clear
curl 'wttr.in/oslo?0'                     #remove if you don't want potential slowdowns when terminal starts
echo ''
ls
echo ''
