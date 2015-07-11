// columns 2.5.6.8 are merged
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
typedef struct _Node{
	int SeqNum;
	struct _Node * CNext;
	struct _Node * FNext; 
}Node;
char ** Instruction;
char swap[4];
void creat_child(Node ** , int , int );
int Statistic[10]={0};
void digest_instruction(char *);
int main( int argc, char * argv[]){
	FILE * hIFile, * hOFile;
	char * sIFile, * sOFile;
	sIFile = (char *)malloc(100*sizeof(char));
	sOFile = (char *)malloc(100*sizeof(char));
	strcpy(sIFile, argv[1]);
	strcpy(sOFile, argv[2]);
	hIFile = fopen(sIFile,"r");
	char Buffer[500];	
	char * ptr;
	int i,j;
	int ST[2] = {0};
	int nNumOfNodes = 0;
	int Sign = 0;
	Instruction = (char **)malloc(10*sizeof(char *));
	Instruction[0] = "mov ";
	Instruction[1] = "lea lds les lfs lgs lss ";
	Instruction[2] = "lahf sahf pushf popf pushd popd ";
	Instruction[3] = "add adc inc aaa daa sub sbb dec nec cmp aas das mul imul aam div idiv aad cbw cwd cwde cdq ";
	Instruction[4] = "and or xor not test shl sal shr sar rol ror rcl rcr test ";
	Instruction[5] = "movs comps scas lods stos ";
	Instruction[6] = "push pop ";
	Instruction[7] = "ja jnbe jae jnb jb jnae jbe jna jg jnle jle jng je jz jne jnz jc jnc jno jnp jpo jns js loop loope loopz jcxz jecsz ";
	Instruction[8] = "jmp ";
	Instruction[9] = "call ";
	for(; fgets(Buffer, 500, hIFile);){
		if( Buffer[0] == '/'){
			Sign = 1;
			break;
		}
		if(!strstr(Buffer, "node:")){ 
			digest_instruction(Buffer);	
			continue;
		}
		if(Buffer[strlen(Buffer)-1] != ':')
			digest_instruction(strstr(Buffer,"label: ") + 8); 	
		nNumOfNodes ++;
	}
	if(nNumOfNodes < 10){
		fclose(hIFile);
		return 0;
	}
	Node ** MyNodeList;
	MyNodeList = (Node **)malloc(nNumOfNodes * sizeof(Node *));
	for( i = 0; i < nNumOfNodes; i ++){
		MyNodeList[i] = (Node *)malloc(sizeof(Node));
		MyNodeList[i]->SeqNum = i;
		MyNodeList[i]->CNext = NULL;
		MyNodeList[i]->FNext = NULL;
	}
	for(; fgets(Buffer, 500, hIFile);){
		if( Buffer[0] == '/'){
			if(Sign) fprintf(stderr,"Warning! Node without edges from it!\n \tInput: %s; Output: %s\n", sIFile, sOFile);
			continue;
		}
		if( Buffer[0] == '}')
			break;
		Sign = 0;
		ST[0] = 0;
		ST[1] = 0;
		for( i = 21, j = 0; Buffer[i]; i ++){
			if( Buffer[i] > 47 && Buffer[i] < 58){
				ST[j] *= 10;
				ST[j] += Buffer[i] - 48;
			}
			else
				j = 1;
		}
		creat_child(MyNodeList, ST[0], ST[1]);
	}
	fclose(hIFile);
	hOFile = fopen(sOFile,"w");
	int nValue;
	Node * TmpNode;
	for( i = 0; i < 10; i ++){
		fprintf(hOFile, "%d\n", Statistic[i]);
	}
	for( i = 0; i < nNumOfNodes; i ++){
		nValue = i + 10000;
		nValue *= 100;
		fprintf(hOFile, "%d\n\t", nValue);
		for(TmpNode = MyNodeList[i]->FNext; TmpNode; TmpNode = TmpNode->FNext){
			nValue = TmpNode->SeqNum; 
			nValue += 10000;
			nValue *= 100;
			fprintf(hOFile, "%d ",nValue); 
		}
		fprintf(hOFile, "\n\t");
		for(TmpNode = MyNodeList[i]->CNext; TmpNode; TmpNode = TmpNode->CNext){
			nValue = TmpNode->SeqNum; 
			nValue += 10000;
			nValue *= 100;
			fprintf(hOFile, "%d ",nValue); 
		}
		fprintf(hOFile, "\n");
	}
	fclose(hOFile);
	return 0;
}

void creat_child(Node ** MyNodeList, int a, int b){
	Node * TmpNode;
	TmpNode = MyNodeList[a];
	for(; TmpNode->CNext; TmpNode = TmpNode->CNext);
	TmpNode->CNext = (Node *)malloc(sizeof(Node));
	TmpNode->CNext->SeqNum = b;
	TmpNode->CNext->CNext = NULL;

	TmpNode = MyNodeList[b];
	for(; TmpNode->FNext; TmpNode = TmpNode->FNext);
	TmpNode->FNext = (Node *)malloc(sizeof(Node));
	TmpNode->FNext->SeqNum = a;
	TmpNode->FNext->FNext = NULL;
}

void digest_instruction(char * Buffer){
	int i = 0;
	for( i = 0; i < 4 && (*(Buffer+i) != ' '); i ++)
		swap[i] = Buffer[i];		
	if( i < 4)
		swap[i]='\0';
	for( i = 0; i < 10; i ++){
		if(strstr(Instruction[i],swap)){
			Statistic[i] ++;
			break;
		}
	}
}
