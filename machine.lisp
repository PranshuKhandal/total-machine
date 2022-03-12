#!/usr/bin/env -S sbcl --script

(load "./package.lisp")
(load "./utilities.lisp")
(load "./command-management.lisp")
(load "./state-management.lisp")
(load "./total-machine.lisp")

(in-package :total-machine)

(main)
