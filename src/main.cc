#include <iostream>
#include <stdlib.h>
#include <stdio.h>

// http://theboostcpplibraries.com/boost.program_options
#include <boost/program_options.hpp>
namespace po = boost::program_options;

#include "shlex.hpp"
using namespace shlex;

void process_args(int argc, const char *argv[], options &opts)
{
	po::options_description desc("Options");
	desc.add_options()
		("help,h", "produce help message")
		("m4", "output in m4 format")
		("version,v", "version");
	;
	po::variables_map vm;
	po::store(po::parse_command_line(argc, argv, desc), vm);
	po::notify(vm);

	if(vm.count("help")) {
		std::cout << desc << "\n";
		exit(EXIT_SUCCESS);
	}

	if(vm.count("version")) {
		std::cout << "shlex (" << PACKAGE_NAME << ") " << VERSION << "\n";
		exit(EXIT_SUCCESS);
	}

	if(vm.count("m4")) opts.ofmt = M4;

}

int main(int argc, const char *argv[])
{

	//po::options_description desc("Options");
	options opts;
	try { process_args(argc, argv, opts); }
	catch (const std::exception& ex)
	{
		std::cerr << "Error processings args. Aborting abnormally.\nTry shlex -h\n";
		std::cerr << ex.what() << "\n";
		exit(EXIT_FAILURE);
	}

	shlex::shlexmat mat = shlex::read(std::cin, opts);
	shlex::write(mat, opts);
	return EXIT_SUCCESS;
}
