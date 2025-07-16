.PHONY: all
all: main-branch

.PHONY: main-branch
main-branch:
	git -C main-branch fetch --all
	cd main-branch && eval $$(opam env) && opam exec -- dune clean && rm -rf _opam && opam switch create . --deps-only --repos dldc=https://dldc.lib.uchicago.edu/opam,default --yes && eval $$(opam env) && opam exec -- dune exec -- attc --backend=ocamlnet < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_ocamlnet.mbox 2> ../output/kaegiw_inbox_errors_ocamlnet.log && opam exec -- dune exec -- attc --backend=mrmime < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_mrmime.mbox 2> ../output/kaegiw_inbox_errors_mrmime.log
