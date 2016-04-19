%{
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <vector>
using std::cout;
using std::endl;
using std::vector;
using std::string;

#include "shlex.tab.h"
#define YY_DECL extern "C" int yylex()

%}


%option noyywrap

%%

\"([^\\\"]|\\.)*\"  { yylval.str = yytext; return QSTR; }

%%

int main_lex()
{
	yylex();
	return EXIT_SUCCESS;
}

