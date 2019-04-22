digit [0-9]
%{
#include<stdio.h>
#include<string.h>
int i;
%}
%%
"switch (expression)"\n"{" {printf(" ");}
"case" {printf("if(");}
value{digit}* {printf("%s )",yytext);}
: {printf(" ");}
break; {printf("else");}
default {printf(" ");}
statement1";"|statement2";"|statementDefault";" {printf("       %s",yytext);}
\} {printf(" ");}
%%

int main(int argc, char* argv[])
{
if(argc > 1){
FILE *fp = fopen(argv[1], "r");
yyin = fp;
yylex();
fclose(yyin);
}
return 0;
}

