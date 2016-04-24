#ifndef SHLEX_H
#define SHLEX_H

#include <string>
#include <vector>

typedef std::vector<std::string> strings;
typedef std::vector<strings> strmat;

extern strings row;
extern strmat rows;

extern "C" int yyparse();


#endif
