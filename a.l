%{
int yyline=0;
%}
%%
^(.*)\n printf("%4d\t%s",++yyline,yytext);
%%
int main(int argc,char *argv[])
{
yyin=fopen("a.txt","r");
yylex();
fclose(yyin);
}
