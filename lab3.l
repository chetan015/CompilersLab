%{
#include <stdio.h>
#include <string.h>
int pos = 0, neg = 0, pf = 0, nf = 0;
%}

%%

\+?[0-9]+\.[0-9]+	{pf++;}
-[0-9]+\.[0-9]+		{nf++;}
\+?[0-9]+	{pos++;}
-[0-9]+		{neg++;}


%%
int yywrap(){
	return 1;
}

int main(){
	printf("Enter some numbers/fractions:\n");
	yylex();
	printf("\nPositive Numbers:%d\nNegative Numbers:%d\n",pos, neg);
	printf("\nPositive Fractions:%d\nNegative Fractions:%d\n",pf,nf);
	return 1;
}
