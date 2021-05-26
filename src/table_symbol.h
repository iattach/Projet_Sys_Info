#ifndef TABLE_SYMBOL_H
#define TABLE_SYMBOL_H

//indice de tableau = address
struct symbol
{
  char id[256];//nom de variable
  int depth;//porte de variable
};

int push_symbol(const char *id, int depth);

int find_symbol(const char *id, int depth);

void pop_symbol();

int get_last_index();

void clear_symbols_by_depth(int depth);

void display_table();

#endif