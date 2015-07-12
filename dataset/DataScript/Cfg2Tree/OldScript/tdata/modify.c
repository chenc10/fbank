#include<stdio.h>
#include<string.h>
#include<stdlib.h>
int main( int argc, char * argv[]){
	FILE * hIFile;
	char * sIFile;
	sIFile = (char *)malloc(100*sizeof(char));
	strcpy(sIFile, argv[1]);
	hIFile = fopen(sIFile,"r");
	char Buffer[500];	
	int nNumOfNodes = 0;
	for(; fgets(Buffer, 500, hIFile);){
		nNumOfNodes ++;
		if(nNumOfNodes > 29){
			fclose(hIFile);
			return 1;
		}
	}
	fclose(hIFile);	
	return 0;
}
