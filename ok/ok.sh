#set -x
[ -z $1 ] && message="change something" || message=$1
[ -z $2 ] && respository="origin" || respository=$2
#echo $message $respository
push="git push "$respository
cat <<HERE_DOCUMENT
> git add .
> git commit -m "$message"
> git push "$respository"
> [Y/n]?
HERE_DOCUMENT
read ans
echo "> $ans"
if [ "x${ans}" = "xy" ] || [ "x${ans}" = "xY" ] || [ "x${ans}" = "x" ]; then
	git add --all .
	git commit -m "$message"
	git push "$respository"
fi
