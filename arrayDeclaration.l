%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
"["	{return OPENSQBR;}
"]"	{return CLOSESQBR;}
";" {return SEMICOLON;}
"int"|"float"|"double" {return DATATYPE;}
[a-zA-Z][a-zA-Z0-9]*	{return IDENTIFIER;}
[0-9]+	{return NUM;}
" " ;
\n {return NL;}
.	{return yytext[0];}
%%








										