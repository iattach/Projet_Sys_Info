%code requires {
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include "table_symbol.h"
}

%{

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include "table_symbol.h"

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
    //------------------------------------------------------------------------
    //remember last read var 

    char last_var_read[256];

    void update_last_var(const char* new_var) {
        memset(last_var_read, '\0', 256);
        strcpy(last_var_read, new_var);
    }
    int current_depth = 0;
    int current_func = -1;

    //------------------------------------------------------------------------

    //table instructions
    struct output_instructions {
      int last_line;
      char instructions[3000][32];
    };

    struct output_instructions output = {0};
  
    void add_to_output(char * format, ...) {
      char buffer[32];
      va_list aptr;
      va_start(aptr, format);
      vsprintf(buffer, format, aptr);
      va_end(aptr);
      strcpy(output.instructions[output.last_line], buffer);
      output.last_line++;
    }

    void display_output() {
      printf("main:\n");
      if (output_file != NULL) fprintf(output_file, "main:\n");
      for(int i=0; i<output.last_line; i++) {
          printf("%d\t%s\n",i,output.instructions[i]);
          if (output_file != NULL) {
              fprintf(output_file, "\t%s\n", output.instructions[i]);
          }
        }
    }
    //------------------------------------------------------------------------

    void add_affectation(const char* var){
        int adr = find_symbol(var, current_depth, current_func);
        int last_adr = get_last_index();
        printf("test : COP %d %d\n", adr, last_adr);
        add_to_output("COP %d %d", adr, last_adr);
        set_initialized(var, current_depth, current_func);
    }

    void add_operation(const char* operator) {
        int adr_first = get_last_index()-1;
        int adr_second = get_last_index();
        add_to_output("%s %d %d %d",operator,adr_first,adr_first,adr_second);
        pop_symbol();
    }
    void add_to_instruction(char *instruction, int line) {
        char buffer[32];
        sprintf(buffer, "%d", line);
        strcpy(instruction, strcat(instruction, buffer));
    }
    void add_condition(char * operation_code) {
      int adr_first_operand = get_last_index()-1;
      int adr_second_operand = get_last_index();
      int new_adr;
      if(strcmp(operation_code,"==")==0) {
        add_to_output("EQU %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
      }
      else if(strcmp(operation_code,"!=")==0) {
        new_adr = push_symbol("$", current_depth, 0, 0, current_func);
        add_to_output("INF %d %d %d",new_adr,adr_first_operand,adr_second_operand);
        add_to_output("SUP %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
        add_to_output("ADD %d %d %d",adr_first_operand,adr_first_operand,new_adr);
        pop_symbol();
      }
      else if(strcmp(operation_code,"<")==0) {
        add_to_output("INF %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
      }
      else if(strcmp(operation_code,"<=")==0) {
        new_adr = push_symbol("$", current_depth, 0, 0, current_func);
        add_to_output("INF %d %d %d",new_adr,adr_first_operand,adr_second_operand);
        add_to_output("EQU %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
        add_to_output("ADD %d %d %d",adr_first_operand,adr_first_operand,new_adr);
        pop_symbol();
      }
      else if(strcmp(operation_code,">")==0) {
        add_to_output("SUP %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
      }
      else if(strcmp(operation_code,">=")==0) {
        new_adr = push_symbol("$", current_depth, 0, 0, current_func);
        add_to_output("SUP %d %d %d",new_adr,adr_first_operand,adr_second_operand);
        add_to_output("EQU %d %d %d",adr_first_operand,adr_first_operand,adr_second_operand);
        add_to_output("ADD %d %d %d",adr_first_operand,adr_first_operand,new_adr);
        pop_symbol();
      }
      pop_symbol();
  }
    //------------------------------------------------------------------------

%}

%union{
    char *str;
    int number;
    float reel;
}

%type<number> Test
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
%left tINF tSUP tINFEQUAL tSUPEQUAL tNOTEQUAL


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
            |Print
            |IfStatement
            |WhileLoop 
            ;

Declaration:tINT tVAR  
            {
                update_last_var($2);
                int adr = push_symbol($2, current_depth, 0, 0, current_func);
                printf("push symbol: %s\n",$2);
            }Aff_after_declaration Multi_Declaration 
            |
            ;

Aff_after_declaration:
            tEQUAL E 
            { 
                add_affectation(last_var_read); 
                pop_symbol(); 
            } 
            |
            ;

Multi_Declaration:  tSEP tVAR{
                update_last_var($2);
                printf("push symbol: %s\n",$2);
                int adr = push_symbol($2, current_depth, 0, 0, current_func);
            } 
            Aff_after_declaration Multi_Declaration 
            | tSEMCOL
            ;

Aff:        tVAR tEQUAL E tSEMCOL{
                int constant = is_const($1, current_depth, current_func);
                if(constant == 1){
                    yyerror("Error syntaxique : Modification of a constant is not allowed\n");
                }else{
                    printf("test aff %s\n",$1);
                    add_affectation($1);
                    pop_symbol();
                }
            } 
            ;

E:          tNUMBER{
                int new_adr = push_symbol("$", current_depth, 0, 0, current_func);
                printf("test : AFC %d %d\n", new_adr, $1);
                add_to_output("AFC %d %d", new_adr, $1);
            }  
            |tVAR {
                printf("var : %s\n",$1);
                int current_adr = find_symbol($1, current_depth, current_func);
                int new_adr = push_symbol("$",current_depth, 0, 0, current_func);
                

                add_to_output("COP %d %d", new_adr, current_adr);
            }
            |tOB E tCB
            |Exp
            ;

Exp:        E tADD E {
                    add_operation("ADD"); }
            |E tSUB E  { add_operation("SOU"); }
            |E tMUL E  { add_operation("MUL"); } 
            |E tDIV E  { add_operation("DIV"); }
            |E tCMP E {add_condition("==");}
            |E tINF E {add_condition("<");}
            |E tSUP E {add_condition(">");}
            |E tINFEQUAL E {add_condition("<=");}
            |E tSUPEQUAL E {add_condition(">=");}
            |E tNOTEQUAL E {add_condition("!=");}
            ;   

Print:      tPRINTF tOB tVAR tCB tSEMCOL {
                int adr = find_symbol($3,current_depth,current_func);
                add_to_output("PRI %d",adr);
            }
            ;

IfStatement:
            tIF tOB Exp {
                int adr_res_condition = get_last_index();
                add_to_output("JMF %d ",adr_res_condition);
                pop_symbol();
            }tCB Test tOA  {
                current_depth ++ ;
            }
            Declaration Contenus {
                add_to_output("JMP ");
                add_to_instruction(output.instructions[$6], output.last_line);
            }
            tCA { 
                    clear_symbols_by_depth(current_depth); 
                    current_depth--; 
            } Test
            ElseStatement {
                add_to_instruction(output.instructions[$14], output.last_line);
            }
            ;
Test:       {
                $$ = output.last_line - 1 ;
            }
            ;

ElseStatement:
            tELSE 
            tOA  {current_depth ++ ;}
                Declaration Contenus {
                    clear_symbols_by_depth(current_depth); 
                    current_depth--; 
                }
            tCA
            |
            ;

WhileLoop:
            tWHILE Test tOB Exp tCB  {
                    int adr_condition_result = get_last_index();
                    add_to_output("JMF %d ", adr_condition_result);
                    pop_symbol();
            }
            Test tOA  { current_depth++; } Declaration Contenus {
                add_to_instruction(output.instructions[$7], output.last_line+1);
                add_to_output("JMP %d", $2+1);
            }
            tCA { clear_symbols_by_depth(current_depth); current_depth--; }

            ;
      

%%
int main(int argc, char *argv[]){
    //printf("test1\n");
    //printf("test : %s\n",argv[1]);
    yyin=fopen(argv[1],"r");
    if(argc>2){
        output_file=fopen(argv[2],"w");
    }
    yyparse();
    display_table();
    display_output();
    //printf("test\n");
    return 0; 
}
