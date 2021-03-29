/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_YACC_ASM_TAB_H_INCLUDED
# define YY_YY_YACC_ASM_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif
/* "%code requires" blocks.  */
#line 1 "yacc_asm.y" /* yacc.c:1909  */

    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include <stdarg.h>
    #include "table_symbol.h"
    #include "table_function.h"

#line 53 "yacc_asm.tab.h" /* yacc.c:1909  */

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    tNUMBER = 258,
    tREAL = 259,
    tVAR = 260,
    tADD = 261,
    tSUB = 262,
    tDIV = 263,
    tMUL = 264,
    tEQUAL = 265,
    tOB = 266,
    tCB = 267,
    tOA = 268,
    tCA = 269,
    tINT = 270,
    tCHAR = 271,
    tVOID = 272,
    tERROR = 273,
    tSEMCOL = 274,
    tSEP = 275,
    tMain = 276,
    tRET = 277,
    tWHILE = 278,
    tIF = 279,
    tELSE = 280,
    tCONST = 281,
    tPRINTF = 282,
    tCMP = 283,
    tINF = 284,
    tSUP = 285,
    tINFEQUAL = 286,
    tSUPEQUAL = 287,
    tFLOAT = 288,
    tArg = 289,
    tNOTEQUAL = 290
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 37 "yacc_asm.y" /* yacc.c:1909  */

    char *str;
    int number;
    float reel;

#line 107 "yacc_asm.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_YACC_ASM_TAB_H_INCLUDED  */
