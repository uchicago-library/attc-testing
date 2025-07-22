#!/bin/sh

# verbosity for debuggage
set -e
set -x

# git command to check for updates
# THERE_ARE_UPDATES="git remote -C $2-branch update > /dev/null 2> /dev/null && git diff -C $2-branch --quiet origin/$2"

# set FORCE_TESTS to make it run regardless of updates to the branch
if !(git remote -C $2-branch update > /dev/null 2> /dev/null && git diff -C $2-branch --quiet origin/$2) || [ $FORCE_TESTS ]
then git -C $2-branch fetch --all
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
else :
fi
