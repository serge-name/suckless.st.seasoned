ST_DIR = $(CURDIR)/st

export QUILT_PATCHES = $(CURDIR)/patches
QUILT_FLAG = $(ST_DIR)/.quilt_applied

all: $(ST_DIR)/st

install: $(ST_DIR)/st
	@install -v -p -m 750 -t $(HOME)/bin $<

clean: quilt_pop
	@rm -f $(ST_DIR)/config.h
	@$(MAKE) -C $(ST_DIR) $@

$(ST_DIR)/st: quilt_push
	@$(MAKE) -C $(ST_DIR) all

quilt_push: $(ST_DIR)
	@( cd $(ST_DIR) && test ! -f $(QUILT_FLAG) \
	  && quilt push && touch $(QUILT_FLAG) || true )

quilt_pop: $(ST_DIR)
	@( cd $(ST_DIR) && test -f $(QUILT_FLAG) \
	  && quilt pop && rm -f $(QUILT_FLAG) || true )

$(ST_DIR):
	@git submodule init
	@git submodule update

.PHONY: quilt_push quilt_pop
