FORCE_TESTS=false
export FORCE_TESTS

.PHONY: all
all: mbox-experiments
# main

.PHONY: mbox-experiments
mbox-experiments:
	./update-branches.sh $@

.PHONY: main
main:
	./update-branches.sh $@
