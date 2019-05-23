%{
#include <stdio.h>
#include "y.tab.h"
extern YYSTYPE yylval;
%}
letter [a-zA-Z]		
%%
Meaning	{return MEANING;}
Remove	{return REMOVE;}
{letter}+	{yylval.string=strdup(yytext);return WORD;}
({letter}+|" ")+	{yylval.string=strdup(yytext);return SENTENCE;}
[^letter]	{return(yytext[0]);}
%%

