letter [a-zA-Z]
dig [0-9]

%%
[ \t]		;
[ \n]   { yylineno = yylineno + 1;}
void    return VOID;
int	return INT;
float   return FLOAT;
char    return CHAR;
double  return DOUBLE;
for 	return FOR;
while	return WHILE;
if	return IF;
else	return ELSE;
printf  return PRINTF;
scanf   return SCANF;
^"#include ".+ ;
{dig}+       return NUM;
{letter}({letter}|{dig})* return ID;
"<="    return LE;
">="    return GE;
"=="    return EQ;
"!="    return NE;
">"	return GT;
"<"	return LT;
"."     return DOT;
\/\/.* ;
\/\*(.*\n)*.*\*\/ ;
.       return yytext[0];
%%

