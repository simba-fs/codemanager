#! /data/data/com.termux/files/usr/bin/bash

if [ $#=1 ];then
	message="change something"
else
	message=$2
fi

if [ "x$1" = "x" ];then
	echo "error:You can't miss [file name]"
else
cat <<tag1 
> mv $1.* ../finish/
> rm $1
> cd ../../
> vi README.md
> ok $message
> [Y/n]?
tag1
	read ans
	if [ "x$ans" = "xy" ] || [ "x$ans" = "xY" ] || [ "x$ans" = "x" ];then
		mv $1.* ../finish/
		rm $1
		cd ../../
		vi README.md
		ok $message
		echo successed!!
	fi
fi
