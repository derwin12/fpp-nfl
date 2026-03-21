SRCDIR ?= /opt/fpp/src
include ${SRCDIR}/makefiles/common/setup.mk
include $(SRCDIR)/makefiles/platform/*.mk

all: libfpp-nfl.$(SHLIB_EXT)
debug: all

OBJECTS_fpp_nfl_so += src/FPPProSports.o
LIBS_fpp_nfl_so += -L${SRCDIR} -lfpp -ljsoncpp -lhttpserver -lcurl
CXXFLAGS_src/FPPProSports.o += -I${SRCDIR}

%.o: %.cpp Makefile
	$(CCACHE) $(CC) $(CFLAGS) $(CXXFLAGS) $(CXXFLAGS_$@) -c $< -o $@

libfpp-nfl.$(SHLIB_EXT): $(OBJECTS_fpp_nfl_so) ${SRCDIR}/libfpp.$(SHLIB_EXT)
	$(CCACHE) $(CC) -shared $(CFLAGS_$@) $(OBJECTS_fpp_nfl_so) $(LIBS_fpp_nfl_so) $(LDFLAGS) -o $@

clean:
	rm -f libfpp-nfl.so $(OBJECTS_fpp_nfl_so)
