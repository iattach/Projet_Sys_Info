all:
	bison -d as.y
	flex	al.l
	gcc -c as.tab.c -Wall
	gcc -c lex.yy.c -Wall
	gcc -Wall as.tab.o lex.yy.o -o comp
