ST_DIR = $(CURDIR)/st

export QUILT_PATCHES = $(CURDIR)/patches

.PHONY: all
all: $(ST_DIR)/.git $(ST_DIR)/st

.PHONY: install
install: $(ST_DIR)/st
	@install -v -p -m 750 -t $(HOME)/bin $<

.PHONY: clean
clean: quilt_pop
	@rm -f $(ST_DIR)/config.h
	@$(MAKE) -C $(ST_DIR) $@

$(ST_DIR)/st: quilt_push
	@$(MAKE) -C $(ST_DIR) all

.PHONY: quilt_push
quilt_push: $(ST_DIR)
	@( cd $(ST_DIR) && quilt push -a --leave-rejects; rc=$$?; [ $$rc -eq 2 ] && rc=0; exit $$rc )

.PHONY: quilt_pop
quilt_pop: $(ST_DIR)
	@( cd $(ST_DIR) && quilt pop -aR; rc=$$?; [ $$rc -eq 2 ] && rc=0; exit $$rc )

$(ST_DIR)/.git:
	@git submodule init
	@git submodule update
