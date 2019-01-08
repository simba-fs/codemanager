setupbash(){
	cp -rf .bashrc ~ &&
	cp -rf .bash/ ~ &&
	cp .vimrc ~
	echo $(pwd) > $HOME/tmp.txt
	cd ~
	. .bashrc
}
#function new
new(){
	if [[ $# = 1 ]];then 
		echo "> argument missing >> new [filename]"
	else
		vi $1.data && 
		vi $1.cpp
	fi
}
#function judge
judge(){
	if [[ $# = 1 ]];then 
		echo "> argument missing >> judge [filename]"
	else
		make 
	fi
}
setupbash
