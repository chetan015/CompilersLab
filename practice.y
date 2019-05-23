%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	int yywrap(void);
	void yyerror(char *s);
	int nest = 0;
%}
%start statement 
%token SWITCH CASE IDENTIFIER NUM SEMICOLON OP RELOP OPENBR CLOSEBR OPENCUBR CLOSECUBR NL COLON BREAK DEFAULT IF ELSE DATATYPE
%%
statement: SWITCH OPENBR IDENTIFIER CLOSEBR switchBody {printf("Valid Syntax\n");};
relexp: alpha RELOP alpha;
alpha: IDENTIFIER|NUM;
switchBody: SEMICOLON | OPENCUBR list CLOSECUBR;
list: SEMICOLON | caseList | caseList defaultCase;
caseList: | caseStmt caseList;
caseStmt:CASE OPENBR NUM CLOSEBR COLON SEMICOLON{nest++;}; 
defaultCase: DEFAULT COLON SEMICOLON;



%%
int yywrap(){return 1;}
int main()
{
	printf("Enter the switch construct:\n");
	yyparse();
	printf("\nNo of cases=%d",nest);


}void yyerror(char *s)
{
	printf("Invalid syntax. %s\n",s);
}

/*
stmt: DATATYPE IDENTIFIER DIM SEMICOLON{printf("Valid.\n");};
DIM: D DIM | D;
D: OPENSQBR NUM CLOSESQBR;
ifstmt: IF OPENBR relexp CLOSEBR OPENCUBR stmt CLOSECUBR {$$=$6;} | IF OPENBR relexp CLOSEBR OPENCUBR stmt CLOSECUBR ELSE OPENCUBR stmt CLOSECUBR {$$=$6;};
relexp: alpha RELOP alpha;
alpha: IDENTIFIER|NUM;
stmt: ifstmt {$$+=1;}|SEMICOLON|'s';
*/