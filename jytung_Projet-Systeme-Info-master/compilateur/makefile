all : compilo
lex.yy.c : compilo.l
		flex compilo.l
compilo.tab.c : compilo_asm.y
		yacc -d -v compilo_asm.y
symbol_table.o: symbol_table.c
		$(CC) $(CFLAGS) -c symbol_table.c
assembleur.o: assembleur.c
		$(CC) $(CFLAGS) -c assembleur.c
compilo : lex.yy.c y.tab.c symbol_table.o assembleur.o
		$(CC) $(CFLAGS) lex.yy.c y.tab.c -o compilo $(INC) symbol_table.o assembleur.o
clean:
		rm -rf compilo lex.yy.c y.tab.c *.o
		yacc -d compilo_asm.y
test:
		./compilo < test.c
