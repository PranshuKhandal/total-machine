FILENAME="./machine"

set -xe

if [[ -f $FILENAME ]]; then
	rm $FILENAME
fi

sbcl \
	--load package.lisp \
	--load utilities.lisp \
	--load command-management.lisp \
	--load state-management.lisp \
	--load total-machine.lisp \
	--eval "(total-machine::make-executable)"
