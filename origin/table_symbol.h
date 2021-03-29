#ifndef TABLE_SYMBOL_H
#define TABLE_SYMBOL_H

//indice de tableau = address
struct symbol
{
  char id[256];//nom de variable
  int depth;//porte de variable
  int constant;
  int initialized;
  int pointer;
  int function_id;
};

int push_symbol(const char *id, int depth, int constant, int pointer, int func_id);


int find_symbol(const char *id, int depth, int func_id);


#endif