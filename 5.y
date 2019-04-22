%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}

%token INTEGER
%left '+' '-'
%left '*' '/'
%%
program:
program stmt '\n'
|
;
stmt:
expr  {printf("infix\n");}
|expr1  {printf("prefix\n");}
|expr2  {printf("postfix\n");}
|
;
expr:
INTEGER           { $$ = $1; }
| expr '+' expr   { $$ = $1 + $3; printf("%d ",$$);}
| expr '-' expr   { $$ = $1 - $3; printf("%d ",$$);}
| expr '*' expr   { $$ = $1 * $3; printf("%d ",$$);}
| expr '/' expr   { $$ = $1 / $3; printf("%d ",$$);}
| '(' expr ')'    { $$ = $2 ;}
;
expr1:
INTEGER {$$=$1;}
| '+' expr1 expr1  { $$ = $2 + $3; printf("%d ",$$);}
| '-' expr1 expr1  { $$ = $2 - $3; printf("%d ",$$);}
| '*' expr1 expr1  { $$ = $2 * $3; printf("%d ",$$);}
| '/' expr1 expr1  { $$ = $2 / $3; printf("%d ",$$);}
| '(' expr1 ')'    { $$= $2 ;}
;
expr2:
INTEGER            { $$ = $1; }
| expr2 expr2 '+'  { $$ = $1 + $2; printf("%d ",$$);}
| expr2 expr2 '-'  { $$ = $1 - $2; printf("%d ",$$);}
| expr2 expr2 '*'  { $$ = $1 * $2; printf("%d ",$$);}
| expr2 expr2 '/'  { $$ = $1 / $2; printf("%d ",$$);}
| '(' expr2 ')'    { $$= $2 ;}
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

