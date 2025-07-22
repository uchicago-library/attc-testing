FORCE_TESTS=false
export FORCE_TESTS

.PHONY: all
all: mbox-experiments main-branch

.PHONY: mbox-experiments-branch
mbox-experiments:
	./update-branches.sh $@

.PHONY: main-branch
main:
	./update-branches.sh $@
