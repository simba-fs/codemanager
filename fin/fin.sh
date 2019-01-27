
if [ $#=1 ];then
	message="change something"
else
	message=$2
fi

if [ "x$1" = "x" ];then
	echo "error:You can't miss [file name]"
else
if [[ -f "$1.c" ]] ;then
	file="c"
	echo "> mv $1.c ../finish"
else
	file="cpp"
	echo "> mv $1.cpp ../finish"
fi
if [[ -f "$1.data" ]] ;then
	data=1
	echo "> mv $1.data ../data"
else
	data=0
fi
cat <<tag1 
> cd ../
> vi README.md
> ok $message
> [Y/n]?
tag1
	read ans
	if [ "x$ans" = "xy" ] || [ "x$ans" = "xY" ] || [ "x$ans" = "x" ];then
		mv $1.c* ../finish/
		if [[ $data = 1 ]] ;then
			mv $1.data ../data
		fi
		rm $1
		cd ../
		vi README.md
		ok "$message"
		echo successed!!
	fi
fi
