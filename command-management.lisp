;;;; command-management.lisp

(in-package #:total-machine)

(defun starts-with? (start s)
  (when (<= (length start) (length s))
    (string= start (subseq s 0 (length start)))))

(defun parse-command (s)
  (cond
    ((match string= s "q" "quit" "exit") +ending-symbol+)
    ((starts-with? "set " s)
     (let ((rest (subseq s 4)))
       (cond
         ((starts-with? "index " rest)
          (progn
	    (setf *index* (1- (parse-integer rest :start 6 :junk-allowed t)))
	    t)))))
    (t 'invalid-command)))
