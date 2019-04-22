
fun	[a-z]+\([a-z]+\)
letter	[a-z]
op	[+-*/] 
%{


%}
%%
{fun} {printf("#define %s :",yytext);}
[\n]\{[\n]	;
[^;]";"	{
					int i=0;
				for(i=0;i<yyleng-1;i++)
				{
					printf(" %s",yytext);
				}
			}
\}	;
%%
int main()
{
yylex();
return 0;
}
