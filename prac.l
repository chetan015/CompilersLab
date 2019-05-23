%{
#include <stdio.h>
#include <stdlib.h>
int len=0,count=0,line=0,pf=0,nf=0,p=0,n=0;
char word[100];
%}
letter [a-zA-Z]
dig	[0-9]
%%
{letter}+	{count++;
			if(yyleng>len)	
			{	len=yyleng;
				strcpy(word,yytext);
			}
		}
\+?{dig}+\.{dig}+	{pf++;}
\-{dig}+\.{dig}+	{nf++;}
\+?{dig}+	{p++;}
\-{dig}+	{n++;}
\n line++;
.	;
%%
int yywrap() {return 1;}
int main()
{
	yyin=fopen("Lab1.l","r");
	yyout=fopen("new.c","w");
	//printf("Enter the string:\n");
	yylex();
	fprintf(yyout,"\nNo of words=%d\nLongest word=%s of length=%d\n, Line count= %d ",count,word,len,line);
	fprintf(yyout,"%d\n%d\n%d\n%d\n",pf,nf,p,n);
}








