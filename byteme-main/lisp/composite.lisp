#!/usr/bin/sbcl --script

;Temporary array that holds the prime factors of the composite number in question
(defvar primeFactors)

;Keeps track of how many composite numbers in the range have two unique middle prime factors
(defvar validCount)

;Upper and lower bounds of the range to look for valid composites. Passed in on command line.
(defvar upperBound)
(defvar lowerBound)

;Composite to preform prime factorization on
(defvar targetComposite)

;Sum of all prime factors from valid composites
(defvar sum)

;Sum of each digit in the number passed to each recursive call of collapse
(defvar tempCollapseSum)

;Final value after collapse
(defvar collapseSum)

;counter for while loop in isComposite
(defvar loopCounter)

;Pre-Condition: An integer value from the main program loop counter is passed in
;Post-Condition: A 0 or 1 is returned: 0 if the argument is prime, or 1 if composite
(defun isComposite (num)

	;Uses a known primality test to find composite numbers

	;If the argument is 2 or 3, it is prime so return 0
	(if (or (= num 2) (= num 3))
		(return-from isComposite 0)
	)

	;If the argument is even or divisible by 3, it is composite so return 1
	(if (or (<= num 1) (=(mod num 2) 0) (=(mod num 3) 0))
		(return-from isComposite 1)
	)

	;Reset while loop counter
	(setf loopCounter 5)

	;Test if argument has factors other than itself and 1. If so, return 1
	(loop while (<=(expt loopCounter 2) num)
		do(if (or (=(mod num loopCounter) 0) (=(mod num (+ loopCounter 2)) 0))
			(return-from isComposite 1)
		)
		(setf loopCounter (+ loopCounter 6))
	)

	;If none of the above conditions are met, the number is prime so return 0
	(return-from isComposite 0)

)

;Pre-Condition: The sum of all prime factors from all valid composites has been calcualted and is passed in for the first call.
;Subsequent recursive calls take in the value from the previous call
;Post-Condition: The provided sum is collapsed into a single digit
(defun collapse (num)
	
	;Termination condition: if the mod10 of the number in question is still the number (ie. a single digit), stop making recursive calls and terminate
        (cond((/=(mod num 10) num)
                (setf tempCollapseSum 0)

		;While the mod10 of the number is not the number, add the remainder to tempCollapseSum and set the number equal to itself divided by 10.
		;This grabs each digit of the number and adds them together
                (loop while (/=(mod num 10) num)
                       do(setf tempCollapseSum (+ tempCollapseSum (mod num 10)))
                        (setf num (floor(/ num 10)))
                )

		;Add the last digit (first digit with above method) to tempCollapseSum
                (setf tempCollapseSum (+ tempCollapseSum num))

		;Recursive call
                (collapse tempCollapseSum)
        )
        (t       ;Last statement in lisp gets returned 
		 (setf tempCollapseSum tempCollapseSum))
		 
        )
)

;Pre-Condition: Collapse has been called and a collapsed number returned to be passed in
;Post-Condition: The Roman numeral corresponding to the passed in integer is returned
(defun romNum (num)

	(cond((= num 1)
		"I"
	)
	((= num 2)
		"II"
	)
	((= num 3)
		"III"
	)
	((= num 4)
		"IV"
	)
	((= num 5)
		"V"
	)
	((= num 6)
		"VI"
	)
	((= num 7)
		"VII"
	)
	((= num 8)
		"VIII"
	)
	((= num 9)
		"IX"
	)
	(t	"N"
	)

	)	

)


;Set the bounds of the range to look for composites in from the command line
(setf lowerBound (parse-integer (string-trim "\"" (nth 1 *posix-argv*))))
(setf upperBound (parse-integer (string-trim "\"" (nth 2 *posix-argv*))))

;Initialize the counter for valid composites
(setf validCount 0)

;Initialize sum
(setf sum 0)

;This loop determines which composites in the range are valid by preforming prime factorization on them and looking for those that have only
;two unique middle prime factors
(loop for i from lowerBound to upperBound
	do(cond((= (isComposite i) 1)
		;Set the composite number to preform prime factorization on
		(setf targetComposite i)
		;Reset the dynamic array that holds the prime factors of the targetComposite
		(setf primeFactors (make-array 0 :fill-pointer 0 :adjustable t))
		;Preform prime factorization, stop at the sqrt of the composite
		(loop for j from 2 to (sqrt i)
			;If the composite reaches 1, stop checking additional numbers
			do(if (/= targetComposite 1)
				;If there are three factors in primeFactors, the conditions for a valid composite have not been met, so short circuit the factorization
				(loop while (and (= (mod targetComposite  j) 0) (<(fill-pointer primeFactors)  4))
					do(setf targetComposite (/ targetComposite j))
					;Add the factor to the end of the dynamic array
					(vector-push-extend j primeFactors)
				
			 	 )

			)

		)

		;If the last factor calculated is prime, add it to the list
		(if (=(isComposite targetComposite) 0) 
			(vector-push-extend targetComposite primeFactors)
		)

		;If the dynamic array of factors has a size of exactly two, and those two factors are unique, add them
		;and increase the count of valid composites
		(cond((and (=(fill-pointer primeFactors) 2) (/= (aref primeFactors 0) (aref primeFactors 1)))
                	(setf sum (+ sum (aref primeFactors 0) (aref primeFactors 1)))
                        (setf validCount (+ validCount 1))
                ))

	))
)

;Initialize collapseSum
(setf collapseSum 0)
(setf tempCollapseSum sum)

;Print number of valid composites
(princ "Count: ")
(princ validCount)
(terpri)

;Print sum of valid composites' prime factors
(princ "Sum: ")
(princ sum)
(terpri)

;If at least one valid composite was found, call collapse
;Else set collapseSum to 0
(cond((> validCount 0)
	(setf collapseSum (collapse sum))
	)
	(t	(setf collapseSum 0))
)

;Print the collapsed version of the sum
(princ "Collapse: ")
(princ collapseSum)
(terpri)

;Print the collapsed digit as a Roman numeral
(princ "Roman: ")
(princ (romNum collapseSum))
(terpri)

(princ "-- Hail Caesar!")
(terpri)
