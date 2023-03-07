#!/usr/bin/sbcl --script

;;; Here is a function that reads a file and puts each line of the 
;;; ;;; file into a list (modified from "Practical Common Lisp")
    (defun get-file (filename)
;;;   ;;; The next line handles opening the file
     (with-open-file (stream filename)
;;;          now we read the line, and while there are still lines to read
;;;              we collect them into a list, which gets returned.
                 (loop for line = (read-line stream nil)
                           while line
                                     collect line)))


                                     ;;; Here is the main program to print out the contents of the Bible
                                     ;;; as a large list.

                                     (defvar filename)
                                     (setq filename "/pub/pounds/CSC330/translations/KJV.txt" )

                                     (write-line (write-to-string(length(write (get-file  filename ) ) ) ) )

                                    (write-line " ")

                                     ;;; Now for something cool -- lets use a length function to count 
                                     ;;; the number of lines in the file by counting the elements in the list. 

                              ;;  (write-line (write-to-string (length (get-file  filename ) )))





