#!/usr/bin/sbcl --script

(defun f (i)
  (setq i 1)
  (if (< i 2))
   1
   ( (* i (f (- i 1))))
