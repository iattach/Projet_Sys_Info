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

int push_symbol(const char *id, int depth){
	//trouver si le symbole déjà existe
  struct symbol *new = &(map.symbols[map.size]);
  strcpy(new->id, id);
  new->depth = depth;
  map.size++;
  return map.size - 1;
   
}

int find_symbol(const char *id, int depth){
    //printf("find symbol %s\n",id);
    for (int i = 0; i < map.size; i++)
    {
        struct symbol *current = &(map.symbols[i]);
        //if (current->depth <= depth && current->function_id == func_id){
          //printf("find symbol compare %s | %s\n",current->id,id);
        if (!strcmp(current->id, id)){
          return i;
        }
                
        //}
            
    }
    return -1;
}

void pop_symbol(){
	map.size--;
}

int get_last_index(){
	return map.size - 1;
}

void clear_symbols_by_depth(int depth){
  int fin = 0;
  while(fin == 0) {
      struct symbol *last = &(map.symbols[map.size - 1]);
      if (last->depth == depth) {
        pop_symbol();
        if(map.size == 0) {
          fin = 1;
        }
      } else {
        fin = 1;
      }
  }
}

void display_table(){
    printf("Symbol table :\n");
    for (int i = 0; i < map.size; i++)
    {
        struct symbol *current = &(map.symbols[i]);
        printf("index=%d\t", i);
        printf("id=%s\tconst=%d\tinit=%d\tdepth=%d\tfunc_id=%d\tpointer=%d\n",
          current->id, 
          current->depth
          );
    }
    printf("\n");
}
