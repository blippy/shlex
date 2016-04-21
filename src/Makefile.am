bin_PROGRAMS = shlex #test_lex

STD = -std=gnu++11 -ggdb

BUILT_SOURCES = shlex.yy.c shlex.tab.c
CLEANFILES = $(BUILT_SOURCES)

shlex.yy.c : shlex.l shlex.tab.h
	flex   --outfile=$@ shlex.l

shlex.tab.c shlex.tab.h : shlex.y
	bison -d $<

shlex$(EXEEXT) : shlex.tab.c shlex.yy.c
	$(CXX) $(STD) -D shlex_y_main=main $^ -o $@


test_lex$(EXEEXT) : shlex.yy.c
	$(CXX) $(STD) -D main_lex=main  $< -o $@
