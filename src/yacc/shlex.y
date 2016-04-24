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

bool debug_parser = false;

void ywrite(const char *type, string &val)
{
        if(debug_parser) { cout << type << ": <" << val << ">" << endl; }
}

#define YWRITE(X,Y)  if(debug_parser) cout << X << ": <" << Y << ">" << endl
#define XYWRITE(X,Y) ; 





typedef std::vector<std::string> strings;
typedef std::vector<strings> strmat;

strings row;
strmat rows;

void add_field(string s) { row.push_back(s); }

void add_row() { rows.push_back(row); row.clear(); }



%}

%union {char *str;}

//%token FS
%token RS
%token <str> QSTR
%token <str> USTR

%%

rows:
	row
	| rows row

row: RS
   | fields RS { add_row(); }
   | fields { add_row(); }

fields:
      field
	| fields field

field : QSTR {XYWRITE("QSTR: %s\n", $1); add_field($1); }
	| USTR {XYWRITE("USTR: %s\n", $1); add_field($1); }

%%

int shlex_y_main()
{
	yyparse();

	//for(std::string f: row) {
	for(auto row: rows) {
		cout << "*** ROW:" <<endl;
		for(auto f: row) {
		cout << "field: <" << f << ">" << endl;
		}
		cout << endl;
	}
}

void yyerror(const char *s) {
        cout << "EEK, parse error!  Message: " << s << endl;
        // might as well halt now:
        exit(-1);
}

