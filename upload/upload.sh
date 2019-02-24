computer="/home/simba/git/"
termux="/data/data/com.termux/files/home/git"

until [[ -d .git  ]] ; do
	if [[ $pwd = $computer  ]] ;then
		break
	fi
	cd ..
done
if [[ -f server ]];then
	sudo rm server/* &&
	sudo cp -rf * server &&
else
	echo "no server for this repository"
fi
