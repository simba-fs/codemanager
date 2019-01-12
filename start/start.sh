#是否安裝 g++?
dialog --backtitle "Termux初始設定程式" --yesno "是否安裝 g++?" 10 40
if [ $? = 0 ];then
	pkg install g++ 
fi
#是否安裝 tree?
dialog --backtitle "Termux初始設定程式" --yesno "是否安裝 tree?" 10 40
if [ $? = 0 ];then
	pkg install tree 
fi
#是否安裝 git?
dialog --backtitle "Termux初始設定程式" --yesno "是否安裝 git?" 10 40
if [ $? = 0 ];then
	pkg install git &&
	git config --global alias.tree "log --graph --all --oneline --decorate" &&
#是否設定 git?
	dialog --backtitle "Termux初始設定程式" --yesno "是否設定 git?" 10 40
	if [ $? = 0 ];then
#你在上github的名字?
		dialog --backtitle "Termux初始設定程式--git 初始設定" --inputbox "你在上github的名字?" 10 40 2> ./dialogoutput
			ans=$( cat dialogoutput )
			git config --global user.name "$ans"
#你的email?
		dialog --backtitle "Termux初始設定程式--git 初始設定" --inputbox "你的email?" 10 40 2> ./dialogoutput
			ans=$( cat dialogoutput )
			git config --global user.email "$ans"
#善後
		rm dialogoutput
		echo 設定完成!
	fi
fi
#是否允許存取內部儲存空間?
dialog --backtitle "Termux初始設定程式" --yesno "是否允許存取內部儲存空間?" 10 40
if [ $? = 0 ];then
	termux-setup-storage
fi
#set -x
dialog --backtitle "Termux初始設定程式" --yesno "是否使用推薦的bashrc?" 10 40
if [[ -d ~/.bash/ ]];then
	dialog --backtitle "Termux初始設定程式" --yesno "你可能已經安裝過推薦的bashrc了，你確定要安裝嗎？（會覆蓋）" 10 40
	if [[ $? = 0 ]] ; then
		if [[ -d ~/.bash  ]] ; then
			mkdir ~/.bash
		fi
		cp -rf ../bash/.bashrc ~ && 
		cp -rf ../bash/.bash/ ~ &&
		cp -rf ../bash/.vimrc ~ 
	fi
fi
#set +x
#感謝
dialog --backtitle "Termux初始設定程式" --msgbox "設定完成！\n感謝使用本設定程式！\nCreate by Simba   Copyright" 10 40;
