;;;; total-machine.lisp

(in-package #:total-machine)

(defun parse-calculation (s)
  (let ((state (create-state)))
    (loop for ch across s
          do (update-state state ch))
    (state-to-string state)))

(defun prompt-read (prompt)
  (format *query-io* "~a" prompt)
  (force-output *query-io*)
  (read-line *query-io*))

(defun parse-input (s)
  (unless (zerop (length s))
    (if (or
	 (digit-char-p (char s 0))
	 (match char= (char s 0)
	   +fraction-char+
	   +multi-mode-starting-char+))
	(parse-calculation s)
	(parse-command s))))

(defun parse-operation ()
  (let ((result (parse-input (prompt-read (format nil "[~a] " (incf *index*))))))
    (format t "~a~&~%" result)
    (not (eq +ending-symbol+ result))))

(defun main ()
  (loop while (parse-operation)))

(defun make-executable ()
  (sb-ext:save-lisp-and-die "machine" :toplevel #'main :executable t))
