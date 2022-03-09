;;;; state-management.lisp

(in-package #:total-machine)

(defun char-to-digit (c)
  (- (char-code c) 48))

(defun create-state ()
  (list :sum 0 :fractions 0 :multi-mode nil :multi-sum 0))

(defun incf-sum (state value)
  (incf (getf state :sum) value))

(defun incf-fractions (state)
  (incf (getf state :fractions)))

(defun begin-multi-mode (state)
  (setf (getf state :multi-mode) t))

(defun end-multi-mode (state)
  (setf (getf state :multi-mode) nil)
  (incf-sum state (getf state :multi-sum))
  (setf (getf state :multi-sum) 0))

(defun concat-multi-sum (state value)
  (setf (getf state :multi-sum)
        (+ (* (getf state :multi-sum) 10) value)))

(defun read-multi-state (state)
  (getf state :multi-mode))

(defun state-to-string (state)
  (multiple-value-bind (val rem) (floor (getf state :fractions) 2)
                    (format nil "~a~:[ 1/2~;~]"
                            (+
                             (getf state :sum)
                             (getf state :multi-sum)
                             val)
                            (zerop rem))))

(defun update-state (state ch)
  (if (read-multi-state state)
      (cond
        ((digit-char-p ch)
         (concat-multi-sum state (char-to-digit ch)))
        ((char= ch +multi-mode-ending-char+)
         (end-multi-mode state)))
      (cond
        ((digit-char-p ch)
         (incf-sum state (char-to-digit ch)))
        ((char= ch +fraction-char+)
         (incf-fractions state))
        ((char= ch +multi-mode-starting-char+)
         (begin-multi-mode state)))))
