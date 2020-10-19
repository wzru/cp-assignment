%option noyywrap
%{
    enum yytokentype {
        NUMBER = 258,
        ADD,
        SUB,
        MUL,
        DIV,
        ABS,
        EOL
    };
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
main(int argc, char *argv[])
{
    int tok;
    while(tok=yylex()) {
        printf("%d", tok);
        if(tok==NUMBER) printf(" = %d\n", yylval);
        else printf("\n");
    }
}