%{
#include <stdio.h>
#include "y.tab.h"
#include "string.h"
void yyerror(char *);
%}
letter [a-zA-Z]

%%
{letter}+	{yylval.string=strdup(yytext);printf("%s",yytext);return WORD;}
[ \t]	;
\n	;
.	{ return yytext[0];}
%%
int yywrap(){return 1;}
int main()
{
printf("Enter the statements:");
yylex();
return 1;}/*
yacc -d A1B4.y
lex A1B4.l
gcc y.tab.c lex.yy.c
./a.out
}*/


