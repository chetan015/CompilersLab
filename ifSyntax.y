%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	int yywrap(void);
	void yyerror(char *s);
	int nest=0;
	
%}
%start stList
%token DATATYPE IDENTIFIER NUM OPENSQBR CLOSESQBR SEMICOLON OP RELOP OPENBR CLOSEBR OPENCUBR CLOSECUBR IF ELSE NL
%%
stList: |
		stList ifstmt NL {printf("Nesting level=%d",($2+1));}
		|error NL

ifstmt: IF OPENBR relexp CLOSEBR OPENCUBR stmt CLOSECUBR {$$=$6;} | IF OPENBR relexp CLOSEBR OPENCUBR stmt CLOSECUBR ELSE OPENCUBR stmt CLOSECUBR {$$=$6;};
relexp: alpha RELOP alpha;
alpha: IDENTIFIER|NUM;
stmt: ifstmt {$$+=1;}|SEMICOLON|'s';
%%
int yywrap(){return 1;}
int main()
{
	printf("Enter the statements:\n");
	return yyparse();
	printf("Nesting levels=%d",nest);


}void yyerror(char *s)
{
	printf("Invalid syntax. %s\n",s);
}

/*
stmt: DATATYPE IDENTIFIER DIM SEMICOLON{printf("Valid.\n");};
DIM: D DIM | D;
D: OPENSQBR NUM CLOSESQBR;
*/