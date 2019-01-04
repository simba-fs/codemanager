computer="/home/simba/git/"
termux="/data/data/com.termux/files/home/git"

until [[ -d .git  ]] ; do
	if [[ $pwd = $computer  ]] ;then
		break
	fi
	cd ..
done
[ -z $1 ] && message="change something" || message=$1
[ -z $2 ] && respository="origin" || respository=$2
cat <<HERE_DOCUMENT
> git add .
> git commit -m "$message"
> git push "$respository"
> [Y/n]?
HERE_DOCUMENT
read ans
if [ "x${ans}" = "xy" ] || [ "x${ans}" = "xY" ] || [ "x${ans}" = "x" ]; then
	git add --all .
	git commit -m "$message"
	git push "$respository"
fi
