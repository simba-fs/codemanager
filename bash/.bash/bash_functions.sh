setupbash(){
	echo start
	cp -rf .bashrc ~ &&
	cp -rf .bash/ ~ &&
	cp .vimrc ~ &&
	src=$(pwd) && 
	cd ~ && 
	. .bashrc && 
	cd $src &&
	echo finish
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
		if [[ -f $1.data ]];then
			make $1 &&
			cat $1.data | ./$1 > $1.judge
			
		else
			echo "> judge data file not find  >> put judge data in ./$1.data "
		fi
		
	fi
}
