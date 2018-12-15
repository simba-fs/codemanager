#include <stdlib.h>
#include <stdio.h>

char message[99999]={};
char rm[99999]={};
char mv[99999]={};
char ok[]={};

int print(const char* m){
	printf("> %s\n",m);
	return 0;
}

int exe(){
	char ans=0;
	print(rm);
	print(mv);
	print("cd ~/git/zj/code/finish && vi README.md");
	print(ok);
	print("[Y/n]? ");
	scanf("%c",&ans);
	if(ans=='Y' || ans=='y' || ans==10){
		system(rm);
		system(mv);
		system("cd ~/git/zj/code/finish && vi README.md");
		system(ok);
	}
	return 0;
}

int main(int argc,char* argv[]){
	if(argc==1){
		print("You must can't omit [file name]!!");
	}else if(argc==2){
		sprintf(rm,"rm %s",argv[1]);
		sprintf(mv,"mv %s.* ../finish",argv[1]);
		sprintf(ok,"ok");
		exe();
	}else if(argc==3){
		sprintf(rm,"rm %s",argv[1]);
		sprintf(mv,"mv %s.* ../finish",argv[1]);
		sprintf(ok,"ok %s",argv[2]);
		exe();
	}
	return 0;
}
