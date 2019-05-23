%{
#include <stdio.h>
#include <string.h>
char word[100];
int len=0,count=0;
%}

%%
[a-zA-Z]+	{if(yyleng>len){	len = yyleng; strcpy(word,yytext);count++;}}
.	|
\n	;
%%
int yywrap(){
	return 1;
}

int main(void){
	printf("Enter a string:\n");
	yylex();
	printf("There are %d words. The longest word is %s, of length %d\n",count+1, word,len);
	return 0;
}