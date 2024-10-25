COMPILER = iverilog
PROG = redux

SOURCE_DIRS := $(shell ls -d modulos/*)
SOURCES = $(addsuffix /*[!_TB].v, $(SOURCE_DIRS))
SOURCES += modulos/$(PROG)/$(PROG)_TB.v

.PHONY: limpa faxina clean distclean purge all

$(PROG): $(SOURCES) 
	$(COMPILER) -o $@ $^

clean:
	@rm -f *~ *.bak

purge: clean
	@rm -f $(PROG)
	@rm -f $(PROG).vcd