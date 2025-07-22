#!/bin/sh

# TODO: conditionalize all this on `main` having updates
# git remote update && git diff --quiet origin/main

set -e
set -x

THERE_ARE_UPDATES=git remote update > /dev/null 2> /dev/null && git diff --quiet origin/$2

git -C $2-branch fetch --all
git -C $2-branch pull origin $2
cd $2-branch 
opam switch remove $1 --yes || true
opam switch set ocaml-basics
eval $(opam env)
opam exec -- dune clean
rm -rf _opam || true
opam switch create . --deps-only --repos dldc=https://dldc.lib.uchicago.edu/opam,default --yes
eval $(opam env)
opam exec -- dune exec --display=quiet -- attc --backend=ocamlnet < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_ocamlnet.mbox 2> ../output/kaegiw_inbox_errors_ocamlnet.log
opam exec -- dune exec --display=quiet -- attc --backend=mrmime   < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_mrmime.mbox   2> ../output/kaegiw_inbox_errors_mrmime.log
