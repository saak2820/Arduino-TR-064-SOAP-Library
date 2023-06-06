#!/bin/bash

EXAMPLEFILE := arduino_secrets.h.example
SUBDIRS := $(wildcard examples/*)

all: $(SUBDIRS)
$(SUBDIRS):
	# If $(EXAMPLEFILE) exists, move it to arduino_secrets.h
	@echo "Find " $@/$(EXAMPLEFILE)
	@if [ -f $@/$(EXAMPLEFILE) ]; then \
		mv $@/$(EXAMPLEFILE) $@/arduino_secrets.h; \
	else echo "Not found"; \
	fi

.PHONY: all $(SUBDIRS)