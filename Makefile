
all: st
	$(MAKE) -C $< $@

clean: st
	$(MAKE) -C $< $@

st:
	git submodule update

.PHONY: all
