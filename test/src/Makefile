all:
	bison -d yacc_asm.y
	flex al_lex_simple.l
	gcc -c -g yacc_asm.tab.c -Wall
	gcc -c -g lex.yy.c -Wall
	gcc -c  -g table_symbol.c -Wall 
	gcc -Wall -g yacc_asm.tab.o lex.yy.o table_symbol.o -o comp_all
	./comp_all main_asm.c main.txt
test: 
	bison -d yacc.y
	flex al_lex.l
	gcc -c yacc.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -Wall yacc.tab.o lex.yy.o -o comp
	./comp < main_asm.c
simple:
	bison -d yacc.y
	flex al_lex.l
	gcc -c yacc.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -Wall yacc.tab.o lex.yy.o -o comp
	./comp < main.c
clean:
	rm -rf comp* lex.yy.* yacc_asm.tab.* *.o *.output *.asm yacc.tab.* 