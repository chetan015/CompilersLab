%{
#include "y.tab.h"
#include <stdio.h>
#include <string.h>
%}
letter [a-zA-Z]
dig [0-9]
%%
"if"	{yylval.string = strdup(yytext); return IF;}
"goto"	{yylval.string = strdup(yytext); return GOTO;}
{dig}+  {yylval.string = strdup(yytext); return NUM;}
{letter}({letter}|{dig})* {yylval.string = strdup(yytext); return ID;}
[+\-*/\^%]	{yylval.string = strdup(yytext); return OP;}
(<|>|"<="|">="|"=="|"!=") {yylval.string = strdup(yytext); return RELOP;}

\n	{yylval.string = strdup(yytext); return NL;}
.	return yytext[0];
%%

int yywrap()
{
	return 1;
}

