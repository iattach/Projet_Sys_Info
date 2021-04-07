all:
	bison -d yacc_asm.y
	flex al_lex.l
	gcc -c yacc_asm.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -c table_symbol.c -Wall 
	gcc -c table_function.c -Wall 
	gcc -Wall yacc_asm.tab.o lex.yy.o table_symbol.o table_function.o -o comp
	./comp < main.c
simple:
	bison -d yacc.y
	flex al_lex_simple.l
	gcc -c yacc.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -Wall yacc.tab.o lex.yy.o -o comp
	./comp < main.c
clean:
	rm -rf comp lex.yy.* yacc_asm.tab.* *.o *.output *.asm