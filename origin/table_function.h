#ifndef TABLE_FUNCTION_H
#define TABLE_FUNCTION_H

struct instruction
{
  char id[256];
  int nb_params;
  int function_start;
  int return_type;
  int params_code;
};

#endif