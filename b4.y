%{
#include <stdio.h>
#include "string.h"
#define size 10
int yylex(void);
int yyerror(char *s);
void add(char*,char*);
void delete(char*);
void search(char*);

struct word{
	char w[20],m[50];
};
struct word dictionary[size];
int n=0;
%}
%union 
{
	int number;
	char* string;
}
%start statement
%token MEANING REMOVE
%token <string> WORD
%token <string> SENTENCE
%%
statement:   /*empty */
         |
        statement s '\n'
         |
        statement error '\n'
         {
           yyerrok;
         }
         ;
s:	WORD '='SENTENCE';' {add($1,$3);}
	|
	MEANING '('WORD')'';'{search($3);}
|
	REMOVE '('WORD')'';'{delete($3);}	
	;

%%
void add(char *s1,char *s2){
	if(n==size)	
		printf("Dictionary full.\n");
	else{
		strcpy(dictionary[n].w,s1);
		strcpy(dictionary[n].m,s2);
		n++;
	}
	
}
void delete(char *s)
{
	if(n==0)
		printf("Dictionary empty.\n");
	else{
		int i=0,flag=0;
		for(i=0;i<n;i++)
		{
			if(strcmp(dictionary[i].w,s)==0)
			{	flag=1;break;	}
		}
		if(flag)
		{
			while(i<n-1)
			{
			   strcpy(dictionary[i].w,dictionary[i+1].w);
			   strcpy(dictionary[i].m,dictionary[i+1].m);
			   i++;
			}
			n--;
		}
		else
			printf("No such word in Dictionary.\n");
	}
}
void search(char *s)
{
	if(n==0)
		printf("Dictionary empty.\n");
	else{
		int i=0,flag=0;
		for(i=0;i<n;i++)
		{
			if(strcmp(dictionary[i].w,s)==0)
			{	flag=1;break;	}
		}
		if(flag)
		{
			printf("%s\n",dictionary[i].m);
		}
		else
			printf("No such word in Dictionary.\n");
	}
}
int main()
{
printf("\t\tDICTIONARY\n");
 yyparse();
printf("\nTotal words=%d\n",n);
for(int i=0;i<n;i++)
{
	printf("%s: %s\n",dictionary[i].w,dictionary[i].m);
}
return 1;
}
int yyerror(s)
char *s;
{
  fprintf(stderr, "%s\n",s);
}
int yywrap()
{
  return(1);
}
