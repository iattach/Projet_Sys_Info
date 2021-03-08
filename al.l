D   [0-9]
E   [Ee][-+]?{D}+ 
%%
void    printf("v ");
main    printf("name ");
\{  printf("col g ");
\}  printf("col d ");

const   printf("constante ");

int printf("integer ");

\=  printf("egal ");
\+  printf("plus ");
\-  printf("moins ");
\*  printf("fois ");
\/  printf("divise ");

\(  printf("par g ");
\)  printf("par d ");

[\t]+    ;
[\b]+    ;
,   printf("vir ");

[\n]+    ;

;   printf("pv");

printf  printf("prin");

{D}+    |
{D}+{E} printf( "integer ") ;
{D}*"."{D}*({E})?   printf("real "); 
    
return  printf("ret ");

[a-zA-Z][a-zA-Z0-9_]*    printf("mot "); 
%%
int yywrap(){return 1;}
int main(){yylex();return 0;}


