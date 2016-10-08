#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

// gcc hex2float.c -o hex2float.o -lm
// ./hex2float.o

double numfloat = 0.0;

int main() {

    char StringBinary [32]; 
   
    
    // **************+Archivo del ISE binario***********************
    FILE * fp1;
    fp1 = fopen("ResultadoProductoXilinx.txt","r");
    
    //***************Archivo donde se van a guardar
    FILE * fp2;
    fp2 = fopen ("ResultadoISEfloat.txt", "w+"); 
    
    int j;  // Variable para solicitarle al usuario el número del largo del arreglo
    int f = 0; //Variable para el while que se va incrementando
    printf("Tamaño del arreglo en bits: ");  // Solicita al usuario el número de bits del archivo binario xilinx.txt por ejemplo si hay 1024 datos entonces son 10 bits lo que se coloca
    scanf("%d",&j);
    
    j = (int) pow(2,j); // 2**j  tamaño del archivo
    

   
    if (fp1 == NULL) {
	   printf("No existe el archivo\n");
	   return EOF; // Para evitar violación de segmento en caso de que no exista el archivo
	}
    else
   {
	   while (f<j) //Mientras no se detecte fin de archivo;
	   {
				fgets (StringBinary, j, fp1); 
				bin2decimal(StringBinary);
				fprintf(fp2, "%f \n",numfloat);
				f++;
		}
	}
	
	fclose(fp1);
	fclose(fp2);

	return 1;

}




void bin2decimal(char NumBin[])
{


	double exp = 0.0;
	double mantisa = 0.0;
	
	double signo =1.0;
	
	int n;
	
	for (n=1;n<=8;n++){  
		if(NumBin[n] == '1') 
			exp = exp + pow(2,(8-n)); 
	}
	
	for (n=9;n<=31;n++){ 
		if(NumBin[n] == '1')
			mantisa = mantisa + pow(2,(-n + 8)); 
	}
	
	if(NumBin[0] == '1') 
	{
		signo = -1.0;
	}
	numfloat = 0.0;
	mantisa = mantisa + 1.0;
	
	numfloat = signo*mantisa*pow(2,exp-127);
	
	//printf("Float1 value is %f \n", numfloat);
}








