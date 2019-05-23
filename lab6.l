%{
#include <stdio.h>
#include <math.h>
int operator = 0,i;
int a,b;
%}
%%
[0-9]+	{digit();}
"+"	{operator = 1;}
"-"	{operator = 2;}
"*"	{operator = 3;}
"/"	{operator = 4;}
"^"	{operator = 5;}
\n	{printf("Result = %d\n",a);}
%%
void digit(){
	if(operator == 0)
		a = atoi(yytext);
	else
	{
		b = atoi(yytext);
		switch(operator){
			case 1: a = a+b; break;
			case 2: a = a-b; break;
			case 3: a = a*b; break;
			case 4: a = a/b; break;
			case 5: a = pow(a,b); break;
		}
		operator = 0;
	}
}
int yywrap(){
	return 1;
}
int main(){
	printf("Enter the expression: \n");
	yylex();
	return 0;
}
