%{
	#include <stdio.h>
	#include <stdlib.h>
	int yylex(void);
	void yyerror(char *s);
	int yywrap();
	int cc=0,dc=0,sc=0;
	
%}
%start password
%token UPPER LOWER DIGIT SYMBOL NL

%%
password: UPPER alpha NL {
							if(cc>=4){
								if(dc>=1){
									if(sc>=1)
									{
										printf("Valid Password.\n");
									}
									else
										printf("Invalid Password. Atleast one special symbol required.\n");
								}
								else
									printf("Invalid Password. Atleast one digit required.\n");
							}
							else
								printf("Invalid Password. Minimum length 7 required.\n");
							};

alpha: beta alpha | beta;
beta:LETTER {cc++;}
 | DIGIT {dc++;}
 | SYMBOL{sc++;};
LETTER: UPPER | LOWER;

%%
int main()
{
	printf("Enter the string:\n");
	return yyparse();

}
void yyerror(char *s)
{
	printf("Invalid password. Must start with upper case letter. %s\n",s);
}
int yywrap(){return 1;}