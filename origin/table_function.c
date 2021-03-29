#include "string.h"
#include "table_function.h"

struct table_instruction
{
  int size;
  struct instruction insturctions[100];
};

struct table_instruction instructions = {0};


