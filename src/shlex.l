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

bool debug_lexer = false;

void lexer_write(const char *type, const char *val)
{
        if(debug_lexer) {
                cout << type << ": <" << val << ">" << endl;
        }
}




#include "shlex.tab.h"
#define YY_DECL extern "C" int yylex()

%}


%option noyywrap

WS	[ \t]+
NONSPECIAL [^ \t\r\n\"#]+

%%

{WS} { lexer_write("White", yytext); }

"\r\n"|"\n"  {return RS; }

"#".*$   { lexer_write("Comment", yytext); }  

\"([^\\\"]|\\.)*\"  { yylval.str = yytext; return QSTR; }

{NONSPECIAL} { yylval.str = yytext; return USTR; }


%%

int main_lex()
{
	yylex();
	return EXIT_SUCCESS;
}

