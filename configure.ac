AC_PREREQ([2.69])
AC_INIT([shlex], [1.1])

AC_CONFIG_SRCDIR([src/shlex.cc])

# foreign flag tells that we are not conforming to the GNU standards
# and hence can ommit NEWS, README, COPYING
AM_INIT_AUTOMAKE([foreign]) 



# for package configuration
PKG_PROG_PKG_CONFIG
PKG_INSTALLDIR


AC_PROG_CXX

#AC_PROG_FC([gfortran], [Fortran 90]) # we need a Fortran 90 compiler
# If we are using gfortran, but user hasn't set FCFLAGS for 'configure'
# then override autotool defaults
#AS_IF([test x$FC = xgfortran -a x$ac_cv_env_FCFLAGS_set = x],
#   AC_SUBST([FCFLAGS], ["-Wall -O0 -C -fbacktrace"])
#   [Set some flags automatically if using gfortran])



AC_PROG_RANLIB # needed to create libraries

AC_CONFIG_FILES([Makefile src/Makefile])
# Generate a PC file so that others can easily detect our libraries:
AC_CONFIG_FILES([shlex.pc:shlex.pc.in])


AC_OUTPUT
