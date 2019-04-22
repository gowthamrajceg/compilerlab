%{
#include<string.h>
char opn[20],opr[20];
int opn1=0,opr1=0;
%}
brace [)(]
operand [a-zA-z]
operator1 [+\-]
operator2 [\*/]
%%
{brace} {continue;}
{operand} {
//ECHO;
opn[opn1++]=yytext[0];
}
{operator1} {
int i;
char temp;
for(i=strlen(opn);i>=0;i--)
{
opn[i+1]=opn[i];
//printf("\n%s\n",opn);
}
opn[i+1]=yytext[0];
opn1++;

}
{operator2} {
//ECHO;
int i,temp;
temp=strlen(opn);
//printf("%d",temp);
for(i=temp-1;i>temp-2;i--)
{
opn[i+1]=opn[i];
//printf("\n%s\n",opn);
}
opn[i+1]=yytext[0];
opn1++;
//printf("\n%s\n",opn);
}

%%
int main()
{
yylex();
int i=0;
printf("%s",opn);
}
                                                                                                                                                         

