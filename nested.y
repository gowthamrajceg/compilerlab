%{
#include<stdio.h>
int yylex(void);
void yyerror(char*);
%}
%token INTEGER VARIABLE SPECIAL OPEN CLOSE
%%
program :
        program statement '\n' { printf("valid\n");}
        
        |
        ;

statement :
     
     letter OPEN CLOSE{}
        | letter OPEN statement CLOSE {}
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

