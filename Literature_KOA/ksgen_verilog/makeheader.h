#ifndef __MAKEHEADER_H__
#define __MAKEHEADER_H__

void makeheader(FILE *fp, char *filename, char *modulename, char *parent){
	fprintf(fp, "/*******************************************************\n");
	fprintf(fp, "* File Name     : %s\n", filename);
	fprintf(fp, "* Module Name   : %s\n", modulename);
	fprintf(fp, "* Author        : Chester Rebeiro\n");
	fprintf(fp, "* Institute     : Indian Institute of Technology, Madras\n");
	fprintf(fp, "* Creation Time : \n\n");
	fprintf(fp, "* Comment       : Automatically generated from %s\n", parent);
	fprintf(fp, "********************************************************/\n");
}
#endif
