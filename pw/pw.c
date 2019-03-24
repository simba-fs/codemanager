#include <stdio.h>
#include <math.h>

int main(void){
	char c = 0;
	int pw = 193846291;
	
	while(scanf("%c", &c)){
		if(c == '\n'){
			printf("%d\n",pw);
			return pw;
		}
		pw = abs((int)((pw*10000+c*c*c)%100000000));
	}
}
