#include <stdlib.h>
#include <stdio.h>

/* ok.cpp 
 * it's a tiny to for git
 * contain 'git add .'
 * 				 'git commit [message]'
 * 				 'git push [repository]'
 * it will work if you only use 'ok'
 * say goodbey to the long long long command if you think so like me
 * enjoy this tool
 */

char message[99999]={};
char add[]="git add .";
char commit[99999]="git commit -m";
char push[99999]="git push ";
char ans=0;

int print(const char* m){
	printf("> %s\n",m);
	return 0;
}

int out(){
	print(add);
	print(commit);
	print(push);
	print("[Y/n]? ");
	ans=getchar();
	if(ans=='y' || ans=='Y' || ans==10){
		system(add);
		system(commit);
		system(push);
	}
	return 0;
}

int main(int argc,char* argv[]){
	if(argc==1){
		sprintf(commit,"%s \'change something\'",commit);
		out();
	}else if(argc==2){
		sprintf(commit,"%s \'%s\'",commit,argv[1]);
		out();
	}else if(argc==3){
		sprintf(commit,"%s \'%s\'",commit,argv[1]);
		sprintf(push,"%s %s",push,argv[2]);
		out();
	}
	return 0;
}
