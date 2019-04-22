%{
#include<stdlib.h>
#include "y.tab.h"
void yyerror(char*);
%}
%%
[a-zA-Z] {
yylval = yytext[0];
return VARIABLE;
}
[0-9] {
yylval = atoi(yytext);
return INTEGER;
}
[\n] return *yytext;
. {
yylval = yytext[0];
return SPECIAL;
}
%%
int yywrap(void){
return 1;
}
~  
