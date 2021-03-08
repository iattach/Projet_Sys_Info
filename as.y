%union {
	int nombre;
}

%token<nombre> tNB
%token tADD
%token tSUB
%token tOB
%token tCB
%token tPV
%token tERROR

%left tADD
%left tSUB

%type<nombre> E

/* 1 + 2 + 3 + 4 */

/* E => E + E => 1 + E => 1 + E + E ... */
/* E => E + E => E + 4 => E + E + 4 ... */

%%

/* S -> E ; S
 * S ->
 */
S : E tPV
						{ printf("RES: %d\n", $1); }
		S
	|					{ printf("END\n"); }
	;

E : E tADD E	{ $$ = $1 + $3; }
	| E tSUB E	{ $$ = $1 - $3; }
	| tOB E tCB	{ $$ = $2; }
	| tNB				{ $$ = $1; }
	;

%%

void main(void) {
	yyparse();
}
