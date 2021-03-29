#include "table_symbol.h"
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#define TABLESIZE 100

//initialise symbol table

struct table
{
    int size;
    struct symbol symbols[500];
};

struct table map = {0};

int push_symbol(const char *id, int depth, int constant, int pointer, int func_id)
{
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
		printf("Error syntaxique !");
		exit(1);
	}
   
}

int find_symbol(const char *id, int depth, int func_id)
{
    for (int i = 0; i < map.size; i++)
    {
        struct symbol *current = &(map.symbols[i]);
        if (current->depth <= depth && current->function_id == func_id)
            if (!strcmp(current->id, id))
                return i;
    }
    return -1;
}

