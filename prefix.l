%{

#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[a-z] {
yylval=yytext[0];
return INTEGER;
}
[0-9] {
yylval = atoi(yytext);
return INTEGER;
}
[-+*/()\n] return *yytext;
[ \t] ;
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}

