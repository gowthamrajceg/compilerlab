%{
char c[9999],m1[9999],m2[9999];int m11,m22;
%}
%option noyywrap
%%
(switch)[(].+[)][{][\n] {
int i=7;
for(;i<yyleng-3;i++)c[i]=yytext[i];
}
(case)[ ].+[:][\n] {
int i=5;
for(;i<yyleng;i++)m1[m11++]=yytext[i];
m1[m11++]='#';
}
(default:\n) {
int i=9;
for(;i<yyleng;i++)m1[m11++]=yytext[i];
m1[m11++]='#';
}
(.*\n)+(break;\n) {
int i=0;
for(;i<yyleng-7;i++)m2[m22++]=yytext[i];
m2[m22++]='#';


}
%%
int main(){
yyin=fopen("2.txt","r");
yylex();
int i=0,j=0;
int flag=0;

while(m1[i]!='\0'&&m2[j]!='\0'){
printf("if(%s==",c);
for(;m1[i]!='#';i++)printf("%c",m1[i]);
printf("){\n");
for(;m2[j]!='#';j++)printf("%c",m2[j]);
}

return 0;
}

