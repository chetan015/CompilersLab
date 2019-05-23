%{
#include <stdio.h>
#include <stdlib.h>
#include "string.h"
int yylex(void);
int yyerror(char *s);
int ctr = 0, n=0;
char table[40][100];
extern FILE *yyin;
int i;
char x[10],y[10];
%}
%token <string> ID OP GOTO RELOP IF NUM
%token NL
%type <string> arg
%start start
%union 
{
	int number;
	char* string;
}
%%
start:start statement NL|;

statement: ID '=' arg OP arg|ID '=' arg RELOP arg {ctr++; strcpy(x,$3);strcpy(y,$5);
			strcpy(table[n++],$1);
			for(i=0;i<n;i++){
			if(strcmp(table[i],$3)==0) 
				sprintf(x,"(%d)",(i+1));
			if(strcmp(table[i],$5)==0) 
				sprintf(y,"(%d)",(i+1));	
			}
			printf("(%d) %s %s %s %s",ctr,$4,$3,$5,$1);
			printf("\t\t(%d) %s %s %s\n",ctr,$4,x,y);
		}
	|ID '=' OP arg {ctr++; strcpy(x,$4);
			strcpy(table[n++],$1);
			for(i=0;i<n;i++){
			if(strcmp(table[i],$4)==0) 
				sprintf(x,"(%d)",(i+1));
			}
			printf("(%d) %s %s %s",ctr,$3,$4,$1);
			printf("\t\t(%d) %s %s\n",ctr,$3,x);
		}
	|ID '=' arg	{ctr++; strcpy(x,$3);
			strcpy(table[n++],$1);
			for(i=0;i<n;i++){
			if(strcmp(table[i],$3)==0) 
				sprintf(x,"(%d)",(i+1));
			}
			printf("(%d) %s %s",ctr,$3,$1);
			printf("\t\t(%d) %s\n",ctr,x);
		}
	|GOTO '('NUM')'	{ctr++;strcpy(table[n++],"\0");
			printf("(%d) (%s)\t\t\t (%d) (%s)\n",ctr,$3,ctr,$3);}
	|IF'('arg RELOP arg ')'' ' GOTO '('NUM')' {ctr++; strcpy(table[n++],"\0");
			strcpy(x,$3);strcpy(y,$5);
			for(i=0;i<n;i++){
			if(strcmp(table[i],$3)==0) 
				sprintf(x,"(%d)",(i+1));
			if(strcmp(table[i],$5)==0) 
				sprintf(y,"(%d)",(i+1));	
			}
			printf("(%d) %s %s %s (%s)",ctr,$4,$3,$5,$10);
			printf("\t\t(%d) %s %s %s (%s)\n",ctr,$4,x,y,$10);}
	|ID'['NUM']' '=' arg {ctr++;sprintf(table[n++],"%s[%s]",$1,$3);
				strcpy(x,$6);
				for(i=0;i<n;i++){
				if(strcmp(table[i],$6)==0) 
					sprintf(x,"(%d)",(i+1));
				}
				printf("(%d) %s %s[%s]\t\t\t(%d) %s\n",ctr,$6,
					$1,$3,ctr,x);
			}
	;
arg:ID|NUM {$$ = $1;}
;
%%

int yyerror(char *s)
{
	printf("Incorrect Three Address Code");
}

int main(int argc, char *argv[])
{
  printf("Quadruple Form\t\tTriple Form\n");
  yyin = fopen(argv[1], "r");
  yyparse();
  return 1;
}
