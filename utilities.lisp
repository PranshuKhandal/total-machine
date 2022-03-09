;;;; utilities.lisp

(in-package #:total-machine)

;; total-machine.lisp

(defmacro match (fn value &rest args)
  (let ((val-var (gensym)))
    `(let ((,val-var ,value))
       (or ,@(mapcar #'(lambda (arg) `(,fn ,val-var ,arg)) args)))))

(defvar *index* 0)

;; command-management.lisp

(defconstant +ending-symbol+ 'sayonara)

;; state-management.lisp

(defconstant +multi-mode-starting-char+ #\/)
(defconstant +multi-mode-ending-char+ #\/)
(defconstant +fraction-char+ #\.)
