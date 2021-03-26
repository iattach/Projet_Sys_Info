all:
	bison -d yacc.y
	flex al_lex.l
	gcc -c yacc.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -Wall yacc.tab.o lex.yy.o -o comp