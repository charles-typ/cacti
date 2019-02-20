TAR = cacti

.PHONY: dbg opt depend clean clean_dbg clean_opt

all: opt

dbg: $(TAR).mk obj_dbg
	@$(MAKE) TAG=dbg -C . -f $(TAR).mk

opt: $(TAR).mk obj_opt
	@$(MAKE) TAG=opt -C . -f $(TAR).mk

obj_dbg:
	mkdir $@

obj_opt:
	mkdir $@

clean_dbg: obj_dbg
	@$(MAKE) TAG=dbg -C . -f $(TAR).mk clean
	rm -rf $<

clean_opt: obj_opt
	@$(MAKE) TAG=opt -C . -f $(TAR).mk clean
	rm -rf $<

veryclean: clean_dbg clean_opt

CFG ?= cs152-sp19-outputs/L2cache.cfg
OUT := $(CFG).out
CSV := cs152-sp19-outputs/$(notdir $(basename $(CFG))).csv

$(OUT): $(CFG) all
	./cacti -infile $(CFG)

$(CSV): $(OUT)
	mkdir -p $(dir $@)
	cp $< $@

run: $(CSV)

clean:
	rm -rf cs152-sp19-outputs
	rm -rf cs152-sp19-configs/*.out
