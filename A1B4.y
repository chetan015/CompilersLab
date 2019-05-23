%{
#include <stdio.h>
#include "string.h"
int yylex(void);
int yyerror(char *s);
struct word{
	char w[10],m[10];
};
struct word dictionary[10];
int n=0;
%}
%union 
{
	int number;
	char* string;
}
%start statement
%token <string> WORD
%%
statement: WORD";\n"	{printf("Word definition add:%s ",$1);}
	| "Meaning(" WORD ");\n"	{//printf("%s",search($1));
				printf("Search for %s",$2);}
	| "Remove(" WORD ");\n"	{//remove($2);
				printf("Remove for %s",$2);}
	;
%%
int yyerror (char *msg) {
	printf ("Error, unrecognised input. YACC: %s\n", msg);
	}
int main (void) {
	printf("Enter the statements:");
	yyparse();
	}
