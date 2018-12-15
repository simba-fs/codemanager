[ -z $1 ] && message="change something" || message=$1
[ -z $2 ] && respository="origin" || respository=$2
#echo $message $respository
add="git add ."
commit="git commit -m \""$message"\""
push="git push "$respository"\""
echo "> "$add
echo "> "$commit
echo "> "$push
echo "> [Y/n]? "
read ans
if [ $ans=="y" ] || [ $ans=="Y" ] || [ $ans==10 ];
then
	$add
	$commit
	$push
fi
