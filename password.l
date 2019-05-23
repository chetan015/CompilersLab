%{
#include <stdio.h>
#include "y.tab.h"
%}
%%
[A-Z]	{return UPPER;}
[a-z]	{return LOWER;}
[0-9]		{return DIGIT;}
[&$#_]		{return SYMBOL;}
\n {return NL;}
.	{return yytext[0];}
%%








										