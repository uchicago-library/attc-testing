#!/bin/sh

# set -e
# set -x

# name of the sandboxed switch we'll be creating
SWITCH_NAME=$PWD/$1-branch

function there_are_updates() {
    if git -C $1-branch remote update > /dev/null 2> /dev/null && git -C $1-branch diff --quiet origin/$1
    then false
    else true
    fi
}

if there_are_updates
# || $FORCE_TESTS
then echo uh-oh
    # echo $FORCE_TESTS
    #  git -C $1-branch fetch --all
    #  git -C $1-branch pull origin $1
    #  cd $1-branch 
    #  opam switch remove $SWITCH_NAME --yes || true
    #  opam switch set ocaml-basics
    #  eval $(opam env)
    #  opam exec -- dune clean
    #  rm -rf _opam || true
    #  opam switch create . --deps-only --repos dldc=https://dldc.lib.uchicago.edu/opam,default --yes
    #  eval $(opam env)
    #  opam exec -- dune exec --display=quiet -- attc --backend=ocamlnet < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_ocamlnet.mbox 2> ../output/kaegiw_inbox_errors_ocamlnet.log
    #  opam exec -- dune exec --display=quiet -- attc --backend=mrmime   < ../input/kaegiw_inbox.mbox > ../output/kaegiw_inbox_converted_mrmime.mbox   2> ../output/kaegiw_inbox_errors_mrmime.log
else echo "update-branches: nothing to do."
fi
