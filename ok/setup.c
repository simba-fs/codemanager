#include <stdlib.h>
#include <stdio.h>

int main(){
	system("make ok");
	system("cp ok ~/../usr/bin");
	system("rm setup.c");
	system("rm setup");
	printf("Finish !!\n");
	return 0;
}
