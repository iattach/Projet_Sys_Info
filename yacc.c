#include <stdio.h>
#include <stdlib.h>

%token tVoid tId tAcco_g tAcco_d tConstante tInteger tEgal tPlus tMoins tFois tDivise tPar_g tPar_d tVirgule tPvirgule tPrint tReal tMot tReturn

%E : E tPlus E	{ $$ = $1 + $3; }
	| E tMoins E	{ $$ = $1 - $3; }
    | E tFois E	{ $$ = $1 * $3; }
    | E tDivise E	{ $$ = $1 / $3; }
	| tOB E tCB	{ $$ = $2; }
	| tNB				{ $$ = $1; }
	;
%%

S : Fonctions ;

Fonctions : Fonction Fonctions | Fonction ;

Fonction : tInteger tId tPar_g Params tPar_d Body ;

Params : | Param SuiteParam ;
Param : tInteger tId ;

SuiteParams : tVirgule Param SuiteParams | ;

Body : tAcco_g Instructions tAcco_d ;

Instructions : Instruction Instructions | ;

Instruction : Aff | Return | tPvirgule ;

Aff : tId tEgal E tPvirgule ;

Return : tReturn E tPvirgule ;
