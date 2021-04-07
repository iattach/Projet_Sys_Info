#include "table_symbol.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#define TABLESIZE 100

//initialise symbol table

struct table{
    int size;
    struct symbol symbols[500];
};

struct table map = {0};

int push_symbol(const char *id, int depth, int constant, int pointer, int func_id){
	//trouver si le symbole déjà existe
	if(find_symbol(id,depth,func_id)==-1){
		struct symbol *new = &(map.symbols[map.size]);
		strcpy(new->id, id);
		new->initialized = 0;
		new->depth = depth;
		new->constant = constant;
		new->pointer = pointer;
		new->function_id = func_id;
		map.size++;
		return map.size - 1;
	}else{
		printf("Error syntaxique : Double declaration\n");
		exit(1);
	}
   
}

int find_symbol(const char *id, int depth, int func_id){
    for (int i = 0; i < map.size; i++)
    {
        struct symbol *current = &(map.symbols[i]);
        if (current->depth <= depth && current->function_id == func_id)
            if (!strcmp(current->id, id))
                return i;
    }
    return -1;
}

void pop_symbol(){
	map.size--;
}

int get_last_index(){
	return map.size - 1;
}

void set_initialized(const char* id, int depth,int func_id){
	int adr = find_symbol(id,depth,func_id);
	map.symbols[adr].initialise = 1;
}
int is_initialized(const char *id, int depth, int func_id){
    int adr = find_symbol(id, depth, func_id);
    return symbol_table.symbols[adr].initialized;
}

int is_const(const char *id, int depth, int func_id){
    int adr = find_symbol(id, depth, func_id);
    return symbol_table.symbols[adr].constant;
}

int is_pointer(int index){
  return symbol_table.symbols[index].pointer;
}

void clear_symbols_by_func(int func_id){
  int fin = 0;
  while(fin == 0) {
      struct symbol *last = &(symbol_table.symbols[symbol_table.size - 1]);
      if (last->function_id == func_id) {
        pop_symbol();
        if(symbol_table.size == 0) {
          fin = 1;
        }
      } else {
        fin = 1;
      }
  }
}

void clear_symbols_by_depth(int depth){
  int fin = 0;
  while(fin == 0) {
      struct symbol *last = &(symbol_table.symbols[symbol_table.size - 1]);
      if (last->depth == depth) {
        pop_symbol();
        if(symbol_table.size == 0) {
          fin = 1;
        }
      } else {
        fin = 1;
      }
  }
}

void display_table(){
    printf("Symbol table :\n");
    for (int i = 0; i < symbol_table.size; i++)
    {
        struct symbol *current = &(symbol_table.symbols[i]);
        int depth = current->depth;
        printf("index=%d\t", i);
        printf("id=%s\tconst=%d\tinit=%d\tdepth=%d\tfunc_id=%d\tpointer=%d\n",
          current->id, current->constant,
          current->initialized, current->depth,
          current->function_id,
          current->pointer);
    }
    printf("\n");
}
)
