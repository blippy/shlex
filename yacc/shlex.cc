#include <iostream>

#include "shlex.h"

using std::cout;
using std::endl;

int main()
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
