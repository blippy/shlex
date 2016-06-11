#ifndef SHLEX_HPP
#define SHLEX_HPP

#include <string>
#include <vector>
namespace shlex {

typedef struct options 
{
	std::string sep = " ";
} options;

typedef std::vector<std::vector<std::string> > shlexmat;

shlexmat read(std::istream  &istr, const options& opts);
shlexmat read(std::string  &filename, const options& opts);
shlexmat read(const char *fname, const options& opts);

std::vector<std::string> tokenize_line(const std::string &input, const options &opts);

void write(const shlexmat &m);


}
#endif
