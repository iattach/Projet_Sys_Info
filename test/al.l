D   [0-9]
E   [Ee][-+]?{D}+ 
%%
void    printf("func ");
main    printf("nom ");
\{  printf("col_g ");
\}  printf("col_d ");

const   printf("constante ");

int printf("integer ");

\=  printf("egal ");
\+  printf("plus ");
\-  printf("moins ");
\*  printf("fois ");
\/  printf("divise ");

\(  printf("par_g ");
\)  printf("par_d ");

[\t]+    ;
[\b]+    ;
,   printf("vir ");

[\n]+    ;

;   printf("pv ");

printf  printf("prin ");

{D}+    |
{D}+{E} printf( "entier ") ;
{D}*"."{D}*({E})?   printf("reel "); 
    
return  printf("ret ");

[a-zA-Z][a-zA-Z0-9_]*    printf("mot "); 

%%
int yywrap(){return 1;}
int main(){yylex();return 0;}


