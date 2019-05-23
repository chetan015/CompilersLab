%{
    #include <stdio.h>
%}
letter [a-zA-Z]
pmark [!?,.;:]

%%
")"" "+/{pmark} {printf(")");}
")"/{letter} {printf(") ");}
{letter}+" "+/")" {while (yytext[yyleng-1]==' ') yyleng--; ECHO;}
({pmark}|{letter}+)/"(" {ECHO; printf(" ");}
"("" "+/{letter} {while (yytext[yyleng-1]==' ') yyleng--; ECHO;}
{letter}+" "+/{pmark} {while (yytext[yyleng-1]==' ') yyleng--; ECHO;}
ˆ" "+ ;
" "+ {printf(" ");}
. {ECHO;}
\n/\n\n ;
\n {ECHO;}
%%

int yywrap(){return 1;}
int main(){printf("Enter the paragraph:\n");
yylex();
return 1;
}
