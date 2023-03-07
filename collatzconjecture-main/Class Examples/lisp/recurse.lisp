#!/usr/bin/sbcl --script


	(defun factorial(n)
    		(cond
        	(if((= n 0) 1) ;; Special case, 0! = 1
		(print(n))
        		((= n 1) 1) ;; Base case, 1! = 1
        		(t
            ;; Recursive case
            ;; Multiply n by the factorial of n - 1.
                		 (* n (factorial (- n 1)))
        		)
    		)
	)
