set +x
computer="/home/simba/git/"
termux="/data/data/com.termux/files/home/git"
server="../usr/share/apache2/default-site/htdocs/"

until [[ -d .git  ]] ; do
	if [[ $pwd = $computer  ]] ;then
		break
	fi
	cd ..
done
rm server/*
cp ./* server
