digit [0-9]
%{
char stack[999];int top=-1;
void push(char x){stack[++top]=x;}
void pop(){printf("%c",stack[top--]);}
char stop(){return stack[top];}
int notempty(){if(top==-1)return 0;else return 1;}
int pre(char x){
if(x=='+'||x=='-')return 1;
if(x=='*')return 2;
if(x=='/')return 3;
if(x=='(')return 4;
}
%}
%option noyywrap
%%
{digit} {printf("%s",yytext);}
. {char xx=yytext[0];
while(notempty()){
if(xx=='('){push(xx);}
else if(xx==')'){while(stop()!='(')pop();pop();}
else if(pre(xx)<=pre(stop())){pop();}
else break;
}
push(xx);

}
[\n] {while(notempty()){pop();}}
%%
int main(int argc, char* argv[])
{if(argc > 1){
FILE *fp = fopen(argv[1], "r");
yyin = fp;
yylex();
fclose(yyin);
}

//while(notempty()){pop();}
return 0;
}
                                                                                                                                                                                                                                                                                                                                              

