#!/usr/bin/sbcl --script

(defun selSort (largeLengths largeValues)

    (loop with sorted = nil until sorted do
        (setf sorted T)
        (dotimes (x 9)
            (cond ( (> (aref largeLengths x) (aref largeLengths(+ x 1) ) )
                (rotatef (aref largeLengths x) (aref largeLengths(+ x 1) ) )
                (rotatef (aref largeValues x) (aref largeValues(+ x 1) ) )
                (setf sorted T) )
            
            )  
        
        )
    )
)


(defvar x 0)
(defvar y 0)
(defvar increment)
(defvar largeLengths)
(defvar largeLengths (make-array'(10) ) )
(defvar largeValues) 
(defvar largeValues (make-array'(10) ) )

(loop for y from 0 to 9
    do
    (setf(aref largeLengths y) 0)
    (setf(aref largeValues y) 0)
)






(format t "Sort By Ascending Length:~%")
(loop for y from 0 to 9
    do
    (format t "The Floor of ~A has ~A steps to 1.~%" (aref largeLengths y) (aref largeValues y) )
)

(format t "Sort By Ascending Value:~%")
(loop for y from 0 to 9
    do
    (format t "The Floor of ~A has ~A steps to 1.~%" (aref largeValues y) (aref largeLengths y) )
)

(terpri)