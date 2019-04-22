%{
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char*);
%}
%%
"for" {
yylval = yytext[0];
return VARIABLE;
}
"while" {
yylval = yytext[0];
return VARIABLE;
}
[{] {
yylval = yytext[0];
return OPEN;
}
[}] {
yylval = yytext[0];
return CLOSE;
}
[\n] return *yytext;
. ;
%%
int yywrap(void){
return 1;
}

