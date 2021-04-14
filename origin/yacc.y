%code requires {
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include <math.h>
}

%{

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    int yylex(void);
    int yydebug = 1;

    int cmpt_error = 0;
    void yyerror (char const *s) {
        extern int yylineno;
        fprintf (stderr, "ERROR (%d): %s\n", yylineno, s);
        cmpt_error++;
    }

    

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



%start S 
%%

S:          FunctionMain {printf("Function main\n");}
            ;
FunctionMain: tMain {printf("tMain ");} tOB{printf("tOB ");} tCB {printf("tCB ");} Body 
            |
            ;

Body:       tOA {printf("tOA ");} Declaration Contenus tCA{printf("tCA ");} ;

Contenus:   Instruction Contenus
            | 
            ;
Instruction:     Aff 
            |Print
            |IfStatement
            |WhileLoop
            ;

Declaration:tINT tVAR  Aff_after_declaration Multi_Declaration  
            ;

Aff_after_declaration:
            tEQUAL E 
            | 
            ;

Multi_Declaration:  tSEP tVAR
            Aff_after_declaration Multi_Declaration 
            | tSEMCOL
            ;

Aff:        tVAR tEQUAL E tSEMCOL
            ;

E:          tREAL {printf("tREAL ");}
            |tNUMBER  {printf("tNUMBER ");}
            |tVAR  {printf("tVAR ");}
            |tOB E tCB
            |Exp
            ;

Exp:        E tADD E {printf(" + ");}
            |E tSUB E  {printf(" - ");}
            |E tMUL E {printf(" x ");}
            |E tDIV E {printf(" / ");}
            |E tCMP E {printf(" == ");}
            |E tINF E {printf(" < ");}
            |E tSUP E {printf(" > ");}
            |E tINFEQUAL E {printf(" <= ");}
            |E tSUPEQUAL E {printf(" >= ");}
            |E tNOTEQUAL E {printf(" != ");}

            ;   

Print:      tPRINTF tOB tVAR tCB tSEMCOL {printf("tPrintf \n ");}
            ;

IfStatement:
            tIF tOB {printf("tIF ( ");} Exp {printf("Exp ");} tCB {printf(") ");} 
                Body
            ElseStatement
            ;

ElseStatement:
            tELSE {printf("tELSE ");} 
                Body
            |
            ;

WhileLoop:
            tWHILE {printf("tWHILE ");} tOB {printf(" ( ");} Exp {printf("Exp ");} tCB {printf(" ) ");} 
                Body
            ;
%%
int main(void){
    yyparse();
    return 0;
}
