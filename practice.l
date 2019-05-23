%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"if" return IF;
"else" return ELSE;
"switch" return SWITCH;
"case" return CASE;
"break" return BREAK;
"default" return DEFAULT;
"(" return OPENBR;
")" return CLOSEBR;
"{" return OPENCUBR;
"}" return CLOSECUBR;
">"|"<"|"=="|">="|"<="|"!=" return RELOP;
"+"|"*"|"-"|"/" return OP;
":" return COLON;
";" {return SEMICOLON;}
"int"|"float"|"double" {return DATATYPE;}
[a-zA-Z][a-zA-Z0-9]*	{return IDENTIFIER;}
[0-9]+	{return NUM;}
[\t\n' '] ;
.	return yytext[0];
%%
