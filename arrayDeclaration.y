%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	int yywrap(void);
	void yyerror(char *s);
	
	
%}
%start stList
%token DATATYPE IDENTIFIER NUM OPENSQBR CLOSESQBR SEMICOLON NL
%%
stList: |
		stList stmt NL
		| stList error NL {yyerrok;};

stmt: DATATYPE IDENTIFIER DIM SEMICOLON{printf("Valid.\n");};
DIM: D DIM | D;
D: OPENSQBR NUM CLOSESQBR;
%%

int main()
{
	printf("Enter the statements:\n");
	return yyparse();

}
void yyerror(char *s)
{
	printf("Invalid array declaration. %s\n",s);
}
int yywrap(){return 1;}