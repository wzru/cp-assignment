%option noyywrap
%{
#include "calc.tab.h"
    // enum yytokentype {
    //     NUMBER = 258,
    //     ADD,
    //     SUB,
    //     MUL,
    //     DIV,
    //     ABS,
    //     EOL
    // };
    int yylval;

%}

%%
"+" {return ADD;}
"-" {return SUB;}
"*" {return MUL;}
"/" {return DIV;}
"|" {return ABS;}
[0-9]+ {yylval=atoi(yytext); return NUMBER;}
\n {return EOL;}
[ \t] {/* ignore */}
. {printf("Mystery character %c\n",*yytext);}
%%