        %{
#include<stdio.h>
int yylex(void);
void yyerror(char*);
%}
%token INTEGER VARIABLE SPECIAL
%%
program :

        program statement '\n' { printf("valid\n");}
        |
        program statement1 '\n' {printf("invalid\n");}
        |
        ;
statement1:
        SPECIAL
        |       
        statement SPECIAL statement
        |
        SPECIAL statement
        |
        statement SPECIAL
        ;
statement :
     letter expr { }
     |
     letter {}
     ;
expr :
      INTEGER
      |
        VARIABLE
        |
      letter expr{}
      |digit expr{}
      ;
digit :
        INTEGER
        
        ;
letter :
        VARIABLE
        
        ;
%%
void yyerror(char*s)
{
printf("%s",s);
}
int main()
{
yyparse();
return 0;
}

