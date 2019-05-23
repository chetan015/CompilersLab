%{
#include <stdio.h>
#include <stdlib.h>
extern FILE *fp;
%}

%token INT FLOAT CHAR DOUBLE VOID
%token FOR WHILE 
%token IF ELSE PRINTF SCANF
%token NUM ID
%token INCLUDE
%token DOT

%right '='
%left AND OR
%left '<' '>' LE GE EQ NE LT GT
%%

start:	Function {printf("Syntax Verified.");}
	| Declaration {printf("Syntax Verified.");}
	| error	
	;

/* Declaration block */
Declaration: Type Assignment ';' 
	| Assignment ';'  	
	| FunctionCall ';' 	
	| Array ';'	
	| Type Array ';'   	
	;

/* Assignment block */
Assignment: ID '=' Assignment
	| ID '=' FunctionCall
	| ID '=' Array
	| Array '=' Assignment
	| ID ',' Assignment
	| NUM ',' Assignment
	| ID '+' Assignment
	| ID '-' Assignment
	| ID '*' Assignment
	| ID '/' Assignment	
	| NUM '+' Assignment
	| NUM '-' Assignment
	| NUM '*' Assignment
	| NUM '/' Assignment
	| '\'' Assignment '\''	
	| '(' Assignment ')'
	| '-' '(' Assignment ')'
	| '-' NUM
	| '-' ID
	|   NUM	|   ID	;


FunctionCall : ID'('')'
	| ID'('Assignment')'
	;


Array : ID'['Assignment']'
	;

Function: Type ID '(' ArgListOpt ')' CompoundStatement 
	;
ArgListOpt: ArgList
	|
	;
ArgList:  ArgList ',' Arg
	| Arg
	;
Arg:	Type ID
	;
CompoundStatement:	'{' StatementList '}'
	;
StatementList:	StatementList Statement
	|
	;
Statement:	WhileStatement
	| Declaration
	| ForStatement
	| IfStatement
	| PrintFunc
	| ReadFunc
	| ';'
	;

Type:	INT 
	| FLOAT
	| CHAR
	| DOUBLE
	| VOID 
	;

WhileStatement: WHILE '(' Expr ')' Statement  
	| WHILE '(' Expr ')' CompoundStatement 
	;

ForStatement: FOR '(' Expr ';' Expr ';' Expr ')' Statement 
       | FOR '(' Expr ';' Expr ';' Expr ')' CompoundStatement 
       | FOR '(' Expr ')' Statement 
       | FOR '(' Expr ')' CompoundStatement 
	;

IfStatement : IF '(' Expr ')' 
	 	Statement 
;

PrintFunc : PRINTF '(' Expr ')' ';'
	;
ReadFunc : SCANF '(' Expr ')' ';'
	;

Expr:	
	| Expr LE Expr 
	| Expr GE Expr
	| Expr EQ Expr
	| Expr GT Expr
	| Expr LT Expr
	| Expr NE Expr
	| Assignment
	| Array
	;
%%
#include"lex.yy.c"
#include<ctype.h>
int count=0;
int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	
   if(!yyparse())
		printf("\nParsing Complete.\n");
	else
		printf("\nParsing Failed.\n");
	fclose(yyin);
    return 0;
}    
yyerror(char *s) {
	printf("Error at Line - %d : %s %s\n", yylineno, s, yytext );
}
