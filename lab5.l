%{
#include <stdio.h>
int p = 0, s = 0;
%}
%%
"scanf"	{s++;fprintf(yyout,"readf");}
"printf"  {p++;fprintf(yyout,"writef");}
%%
int yywrap(){
	return 1;
}
int main()
{
    yyin = fopen("open.c","r");
    yyout = fopen("new.c","w");
    yylex();
    printf("Number of statements\n   Scanf: %d\n   Printf: %d\n",s,p);
    return 0;
}
	
