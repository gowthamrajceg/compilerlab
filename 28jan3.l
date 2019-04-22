%option noyywrap
%%

"#define".+[\n] {
int i=0;while(yytext[i++]!=' ');
while(yytext[i++]!=')')printf("%c",yytext[i-1]);
printf(")\n{\n\treturn ");i+=2;
while(yytext[i++]!='\n')printf("%c",yytext[i-1]);
printf("\n}\n");
}
%%
int main(int argc, char* argv[])
{if(argc > 1){
FILE *fp = fopen(argv[1], "r");
yyin = fp;
yylex();
fclose(yyin);
}

return 0;
}

