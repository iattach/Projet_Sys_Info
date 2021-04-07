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

void pop_symbol();

int get_last_index();

void set_initialized(const char *id, int depth, int func_id);

int is_initialized(const char *id, int depth, int func_id);

int is_const(const char *id, int depth, int func_id);

int is_pointer(int index);

void clear_symbols_by_func(int func_id);

void clear_symbols_by_depth(int depth);

void display_table();

#endif