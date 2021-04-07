%code requires {
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include "table_symbol.h"
    #include "table_function.h"
}

%{

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include "table_symbol.h"
    #include "table_function.h"

    int yylex(void);
    int yydebug = 1;

    int cmpt_error = 0;
    void yyerror (char const *s) {
        extern int yylineno;
        fprintf (stderr, "ERROR (%d): %s\n", yylineno, s);
        cmpt_error++;
    }

    extern FILE * yyin;
    FILE *output_file = NULL;

    int current_depth = 0;
    int current_func = -1;

%}

%union{
    char *str;
    int number;
    float reel;
}

%token<number>  tNUMBER 
%token<reel> tREAL
%token<str> tVAR
%token  tADD tSUB tDIV tMUL tEQUAL
%token  tOB tCB tOA tCA
%token  tINT tCHAR tVOID tERROR
%token  tSEMCOL tSEP
%token  tMain tRET tWHILE tIF tELSE tCONST tPRINTF
%token  tCMP tINF tSUP tINFEQUAL tSUPEQUAL
%token  tFLOAT tArg tNOTEQUAL

%left tSEP 
%right tEQUAL tADD tSUB tMUL tDIV 
%left tCMP 
%left tINF tSUP tINFEQUAL tSUPEQUAL

%type <number> Type


%start S 
%%

S:          FunctionMain 
            ;
FunctionMain: tMain  tOB tCB  Body
            |
            ;

Body:       tOA  Declaration Contenus tCA ;

Contenus:   Instruction Contenus
            | 
            ;
Instruction:     Aff 
            |Print ;

Declaration:Type VarsAff  
            {
                $1;
            }Vars tSEMCOL  Declaration | 
            ;
	
            ;
Type:       tINT { $$ = 1; }
            |tCHAR { $$ = 2; }
            ;

Vars:       tSEP VarsAff Vars 
            | Vide
            ;
VarsAff:    tVAR 
            {
                int adr = push_symbol($1, current_depth, 0, 0, current_func);
                //display_table();
            }| Aff
            ;

Vide:       ;

Aff:        tVAR tEQUAL E tSEMCOL 
            ;

E:          tREAL 
            |tNUMBER  
            |tVAR  
            |tOB E tCB
            |Exp
            ;

Exp:        E tADD E 
            |E tSUB E  
            |E tMUL E 
            |E tDIV E 
            ;   

Print:      tPRINTF tOB tVAR tCB tSEMCOL 
            ;

      

%%
int main(int argc, char *argv[]){
    printf("test1");
    yyin=fopen(argv[1],"r");
    if(argc>2){
        output_file=fopen(argv[2],"w");
    }
    yyparse();
    printf("test");
    return 0; 
}
