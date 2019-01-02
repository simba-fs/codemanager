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

dialog --backtitle "Termux初始設定程式" --yesno "是否使用推薦的bashrc?" 10 40
if [[ -d ~/.bash ]];then
	dialog --backtitle "Termux初始設定程式" --yesno "你可能已經安裝過推薦的bashrc了，你確定要安裝嗎？（會覆蓋）" 10 40
	if [[ $? = 0]] ;then
	if [ $? = 0 ];then
		if [[ -d ~/.bash  ]] ;then
			mkdir ~/.bash
		fi
		cat << bashrc > ~/.bashrc
. .bash/bash_aliases
. .bash/bash_init
bashrc

		cat << bashinit > ~/.bash/bash_init
#init ~/tmp
rm -rf tmp
mkdir tmp

#setup environment value
BIN=/data/data/com.termux/files/usr/bin/
CODE=$HOME/git/
export PATH=$PATH:~/bin/
crond
bashinit
		cat << bashaliases > ~/.bash/bash_aliases
alias ls='ls -sh -A -C -1'
alias tree='tree -C -h'
alias home='cd ~'
alias bin='cd ~/../usr/bin'
alias code='cd ~/git'
alias reset='reset;home;login'
#alias ftpserver1='tcpsvd -vE 192.168.43.1 3721 ftpd -w ~/'
#alias ftpserver0='tcpsvd -vE 0.0.0.0 3721 ftpd -w ~/'
alias rm='rm -rf'
alias cp='cp -r'
alias pwd=dirs
alias r='vi README.*'
alias ..='cd ../'
alias cl='cd ${1:-'.'} && ls'
bashaliases
	fi
fi
#感謝
dialog --backtitle "Termux初始設定程式" --msgbox "設定完成！\n感謝使用本設定程式！\nCreate by Simba   Copyright" 10 40;


