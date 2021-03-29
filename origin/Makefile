all:
	bison -d yacc.y
	flex al_lex.l
	gcc -c yacc.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -c table_symbol.c -Wall 
	gcc -Wall yacc.tab.o lex.yy.o -o comp
asm:
	bison -d yacc_asm.y
	flex al_lex.l
	gcc -c yacc_asm.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -c table_symbol.c -Wall 
	gcc -Wall yacc_asm.tab.o lex.yy.o -o comp