# contrib/dcsim/Makefile

MODULE_big = dcsim
OBJS = dcsim.o

EXTENSION = dcsim
DATA = dcsim--1.0.sql
PGFILEDESC = "dcsim - Hooks for the DCSim simulator"

REGRESS = dcsim

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/dcsim
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
