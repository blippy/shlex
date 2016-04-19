%{
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <string>
#include <iostream>

//#include "common.h"

using std::string;
using std::vector;
using std::cout;
using std::endl;

extern "C" int yylex();
extern "C" int yyparse();
extern "C" FILE *yyin;

void yyerror(const char *s);

%}

%union {char *str;}

%token <str> QSTR

%%

qstr : QSTR {printf("Computer says: %s\n", $1);}

%%

int shlex_y_main()
{
	yyparse();
}

void yyerror(const char *s) {
        cout << "EEK, parse error!  Message: " << s << endl;
        // might as well halt now:
        exit(-1);
}

