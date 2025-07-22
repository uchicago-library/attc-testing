$FORCE_TESTS=false
export FORCE_TESTS

.PHONY: all
all: mbox-experiments main

.PHONY: mbox-experiments-branch
mbox-experiments:
	env FORCE_TESTS=$(FORCE_TESTS) ./update-branches.sh $@

.PHONY: main-branch
main:
	env FORCE_TESTS=$(FORCE_TESTS) ./update-branches.sh $@
