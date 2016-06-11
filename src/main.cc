#include <iostream>
#include <stdlib.h>
#include <stdio.h>

#include "shlex.hpp"

int main()
{
	shlex::options opts; // go with default options initially
	shlex::shlexmat mat = shlex::read(std::cin, opts);
	shlex::write(mat);
	return EXIT_SUCCESS;
}
