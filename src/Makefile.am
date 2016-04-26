bin_PROGRAMS = shlex 
shlex_SOURCES = main.cc
shlex_LDADD = libshlex.a
lib_LIBRARIES = libshlex.a

libshlex_a_SOURCES = shlex.cc

AM_CXXFLAGS = -std=gnu++11 

#BUILT_SOURCES = shlex.yy.c shlex.tab.c
BUILT_SOURCES = shlex.pch
CLEANFILES = $(BUILT_SOURCES)

shlex.pch : shlex.hpp
	$(CXX) -o $@ $<

#shlex.o : shlex.cc shlex.pch
#	$(CXX) $(STD) -c $<


#main.o : main.cc
#	$(CXX) $(STD) -c $<

#shlex$(EXEXT) : main.o shlex.o
#	$(CXX) $(STD) -o $@ $^

