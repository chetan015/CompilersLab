%{
    #include <stdio.h>
%}
punct [,.;:!?]
text [a-zA-Z]
%s OPEN
%s CLOSE
%s TEXT
%s PUNCT
%%
" "+ ;
<INITIAL>"(" {ECHO; BEGIN OPEN;}
<TEXT>"(" {printf(" "); ECHO; BEGIN OPEN;}
<PUNCT>"(" {printf(" "); ECHO; BEGIN OPEN;}
")" {ECHO ; BEGIN CLOSE;}
<INITIAL>{text}+ {ECHO; BEGIN TEXT;}
<OPEN>{text}+ {ECHO; BEGIN TEXT;}
<CLOSE>{text}+ {printf(" "); ECHO; BEGIN TEXT;}
<TEXT>{text}+ {printf(" "); ECHO; BEGIN TEXT;}
<PUNCT>{text}+ {printf(" "); ECHO; BEGIN TEXT;}
{punct}+ {ECHO; BEGIN PUNCT;}
\n {ECHO; BEGIN INITIAL;}

%%

int yywrap(){return 1;}
int main(){printf("Enter the text paragraph:\n");
yylex();
return 1;
}
