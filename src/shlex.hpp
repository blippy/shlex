#ifndef SHLEX_HPP
#define SHLEX_HPP

#include <string>
#include <vector>
namespace shlex {

typedef std::vector<std::vector<std::string> > shlexmat;

shlexmat read(std::istream  &istr);
shlexmat read(std::string  &filename);
shlexmat read(const char *fname);

std::vector<std::string> tokenize_line(std::string &input);

void write(const shlexmat &m);


}
#endif
