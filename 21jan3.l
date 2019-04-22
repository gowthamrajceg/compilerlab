%{
char c[9999],init[9999],cond[9999],incr[9999],istmt[9999],ostmt[9999];int fc,ii,cc,in;
%}
%option noyywrap
%%

[\t]
(for).+ {fc++;
int i=0;int z=0;
for(;i<yyleng;i++){
if(yytext[i]=='('){z++;continue;}
if(yytext[i]==';'){z++;continue;}
if(yytext[i]==')'){z++;continue;}
switch(z){
case 0:break;
case 1:init[ii++]=yytext[i];break;
case 2:cond[cc++]=yytext[i];break;
case 3:incr[in++]=yytext[i];break;
}}
init[ii++]='#';
cond[cc++]='#';
incr[in++]='#';


}
[}][\n] {fc--;}
.* {int i=0;if(fc==2)for(;i<yyleng;i++)istmt[i]=yytext[i];
else for(;i<yyleng;i++)ostmt[i]=yytext[i];}
%%
int main(){
yyin=fopen("3.txt","r");
yylex();
char inc[999],outc[999];

//printf("istmt:%s\nostmt:%s\n%s\n%s\n%s",istmt,ostmt,init,cond,incr);
int i=0;
printf("\n");
for(;init[i]!=NULL;i++)if(init[i]=='#')printf(";\n");else printf("%c",init[i]);

printf("do\n{\n\tdo\n\t{\n\t\t%s\n\t}while(",istmt);
i=0;
for(;cond[i]!='#';i++)printf("%c",cond[i]);i++;
printf(");\n\t%s\n}while(",ostmt);
for(;cond[i]!='#';i++)printf("%c",cond[i]);
printf(");\n");
return 0;
}



