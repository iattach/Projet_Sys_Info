D   [0-9]
E   [Ee][-+]?{D}+ 
%%
main    printf("name ");
\(  printf("par g ");
\)  printf("par d ");
\{  printf("col g ");
\}  printf("col d ");
int printf("int ");
float   printf("float ");
double  printf("double ");
;   printf("virgule ");
\=  printf("egal ");
\+  printf("plus ");
\-  printf("moins ");
\*  printf("fois ");
\/  printf("divise ");
{D}+    |
{D}+{E} printf( "integer ") ;
{D}*"."{D}*({E})?   printf("real "); 
[a-zA-Z][a-zA-Z0-9]*    printf("mot "); 
%%
int yywrap(){return 1;}
int main(){yylex();return 0;}


