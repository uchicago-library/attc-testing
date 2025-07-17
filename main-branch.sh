#!/bin/sh

git -C main-branch fetch --all
git -C main-branch pull origin main
cd main-branch 
opam switch remove $1 --yes || true
opam switch set ocaml-basics
eval $(opam env)
opam exec -- dune clean
rm -rf _opam || true
opam switch create . --deps-only --repos dldc=https://dldc.lib.uchicago.edu/opam,default --yes
eval $(opam env)
opam exec -- dune exec -- attc --backend=ocamlnet < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_ocamlnet.mbox 2> ../output/kaegiw_inbox_errors_ocamlnet.log
opam exec -- dune exec -- attc --backend=mrmime < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_mrmime.mbox 2> ../output/kaegiw_inbox_errors_mrmime.log
