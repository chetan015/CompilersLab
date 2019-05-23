%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"if" return IF;
"else" return ELSE;
"(" return OPENBR;
")" return CLOSEBR;
"[" return OPENSQBR;
"]" return CLOSESQBR;
"{" return OPENCUBR;
"}" return CLOSECUBR;
">"|"<"|"=="|">="|"<="|"!=" return RELOP;
"+"|"*"|"-"|"/" return OP;
";" {return SEMICOLON;}
"int"|"float"|"double" {return DATATYPE;}
[a-zA-Z][a-zA-Z0-9]*	{return IDENTIFIER;}
[0-9]+	{return NUM;}	
[\t' '] ;
\n 	return NL;
.	return yytext[0];
%%
