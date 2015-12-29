#include <stdio.h>
#include <stdlib.h>
#include <windows.h>

/* run this program using the console pauser or add your own getch, system("pause") or input loop */

int main(void)
{
	FILE *in;
	FILE *out;
	
	char temp;
	int data;
	
	printf("Please provide \"image_binary.txt\" to be converted\n");
	system("pause");
	
	in = fopen("image_binary.txt","r");
	out = fopen("input.bin","wb");
	
	for(int i = 0; i<(640/8*480); i++)
	{
		temp = 0;
		
		for(int j=0; j<8; j++)
		{
			fscanf(in,"%d",&data);
			
			temp |= (((data>0)&1) << j);
		}
		printf("%X ",temp);
		fprintf(out,"%c",temp);
	}
	
	fclose(in);
	fclose(out);
	
	return 0;
}
