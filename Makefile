ST_DIR = $(CURDIR)/st

export QUILT_PATCHES = $(CURDIR)/patches
QUILT_FLAG = $(ST_DIR)/.quilt_applied

all: quilt_push
	$(MAKE) -C $(ST_DIR) $@

clean: quilt_pop
	@rm -f $(ST_DIR)/config.h
	$(MAKE) -C $(ST_DIR) $@

install: all
	@cp -v $(ST_DIR)/st $(HOME)/bin/st

quilt_push: $(ST_DIR)
	@( cd $(ST_DIR) && test ! -f $(QUILT_FLAG) \
	  && quilt push && touch $(QUILT_FLAG) || true )

quilt_pop: $(ST_DIR)
	@( cd $(ST_DIR) && test -f $(QUILT_FLAG) \
	  && quilt pop && rm -f $(QUILT_FLAG) || true )

$(ST_DIR):
	git submodule init
	git submodule update

.PHONY: all quilt_push quilt_pop
