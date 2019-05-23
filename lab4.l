%{
#include <stdio.h>
#include <string.h>

 int cc=0;
 int wc=0;
 int space=0,nl=0;
%}
%%
[a-zA-Z]+ {wc++;cc+=yyleng;}
[" "] {space++;}
[\n] {nl++;}
%%
int yywrap()
{
return 1;
}
main()
{
printf("Enter a string:\n");
yylex();
printf("\nCharacters = %d \nWords = %d \nSpaces = %d \nLines = %d",cc,wc,space,nl);
}
