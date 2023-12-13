######
#
# Note that
# certain installations require the following changes:
#
# atscc -> patscc
# atsopt -> patsopt
# ATSHOME -> PATSHOME
#
######
#
ATSHOMEQ="$(PATSHOME)"
#
######
#
ATSCC=$(ATSHOMEQ)/bin/patscc
ATSOPT=$(ATSHOMEQ)/bin/patsopt
#
######
#
#
# HX: Please uncomment the one you want, or skip it entirely
#
ATSCCFLAGS= -DATS_MEMALLOC_LIBC
# ATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
# ATSCCFLAGS=-O2 -flto
#
#
######
#
challenges::
#
######
#
# Please uncomment the following three lines and replace the name [foo]
# with the name of the file you want to compile
#

challenges:: src/DATS/challenges.dats ; \
  $(ATSCC) $(ATSCCFLAGS) -o $@ $< || echo $@ ": ERROR!!!"

cleanall:: ; $(RMF) challenges

######
#
# You may find these rules useful
#
# %_sats.o: %.sats ; $(ATSCC) $(ATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"
# %_dats.o: %.dats ; $(ATSCC) $(ATSCCFLAGS) -c $< || echo $@ ": ERROR!!!"
#
######
#
RMF=rm -f
#
######
#
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c
#
cleanall:: clean
#
###### end of [Makefile] ######
