#include <iostream>
#include <stdlib.h>
#include <stdio.h>

#include "shlex.hpp"

int main()
{
	shlex::shlexmat mat = shlex::read(std::cin);
	shlex::write(mat);
	/*
	std::string line("hello world");
	for( auto &s : shlex::tokenize_line(line)) {
		std::cout << s << std::endl;
	}
	*/
	return EXIT_SUCCESS;
}
