conditionop "<"|">"|"<="|">="|"!="
letter [a-zA-Z]
digit [0-9]
digits {digit}+
var {letter}+(({digits})*{letter}*)* 
while "while"
%{
char init[9999],cond[9999],incr[9999],stmts[9999],s;
%}
%option noyywrap
%%
.*[\n]*{while} {

int i;
for(i=0;i<yyleng-6;i++){init[i]=yytext[i];}
}
[(].*[)][{] {
int i;
for(i=1;i<yyleng-2;i++)cond[i-1]=yytext[i];cond[yyleng-2-1]=';';}

[^(].*[\n][}] {int i=0;for(;i<yyleng-3;i++)incr[i]=yytext[i];}
[^(].*[\n] {int i=0;for(;i<yyleng;i++)stmts[s++]=yytext[i];}

%%


int  main(){
yyin=fopen("1.txt","r");

yylex();
//printf("%s,%s,%s\n",init,cond,incr);
printf("%s%s%s%s%s%s%s\n","for(",init,cond,incr,"){",stmts,"}");
//printf("init:%s\ncond:%s\nstmt:%s\nincr:%s",init,cond,stmts,incr);
return 0;
}


