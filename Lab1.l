%{
#include <stdio.h>
int vow=0;
int con=0;
%}
letter [a-zA-Z]
%%
[aeiouAEIOU]+           vow++;
[a-zA-Z]    con++;
{letter}+	{printf("Word=%s\n",strdup(yytext));}
({letter}+|" ")+	{printf("Sentence=%s\n",strdup(yytext));}
%%
int yywrap(){
	return 1;
}
int main()
{
	printf("Enter the string:\n");
	yylex();
	//printf("\nNo of vowels = %d\nNo of consonants = %d\n",vow,con);
}
