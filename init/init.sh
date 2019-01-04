repository={ 'zerojudge' 'cgoj' 'codemanager sh' }
codemanagers={ 'fin' 'ok' 'init' 'start' }
cd ~/git
for i in $repository
do
	cd $i &&
	git pull && 
	cd .. &&   
done

cd codemanager && 
for i in $codemanagers
do 
	cd $i && 
	./setup.sh && 
	cd .. && 
done
echo '> successed!'
