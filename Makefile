dotdir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

.PHONY: deploy
deploy:
	@for t in $(shell find $(dotdir) -d 1 -not -name Makefile -not -name .gitignore) ; do \
		ln -sf $$t $(HOME)/ ;\
	done
