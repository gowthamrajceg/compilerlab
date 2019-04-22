um{
char fn[100],c[100];
%}

%%
"#define".+[\n] {
int i=0;
while(yytext[i++]!=' ');
while(yytext[i++]!=')')
printf("%c",yytext[i-1]);
printf("){\n return ");i+=2;
while(yytext[i++]!='\n')
printf("%c",yytext[i-1]);
printf("}");
}
%%

int main()
{
yylex();
}
