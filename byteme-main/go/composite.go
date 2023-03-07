package main

import("os"
       "fmt"
	"strconv"
	"math")

//Precondition: user has passed in upper and lower bound through command line
//Postcondition: Vector of size size upper_bound is filled with 0's and 1's, wi
//		with a 1 indicvation value of the index is a composite integer

func gen_composites(n int64) int64{
		
	
	//Precondition: an integer between upper and lower bounds defined by user is passed in
	//Postcondition: a 0 is returned if n is prime and a 1 is returned if n is composite

	//2 and 3 are prime, return 0
	if n == 2 || n == 3{
		return 0	
	}

	//if n is divisble by 2 or 3 it is composite, return 1
	if n <= 1 ||  n % 2 == 0 || n % 3 == 0{
		return 1
	} 
	
	i := int64(5)
			
	//if n has factors other than itself, it is composite, return 1
	for i*i <= n{
		if n % i == 0 || n % (i + 2) == 0{
			return 1
		}
		
		i += 6
	}
	
	//if all conditions fail, n is prime, return 0
	return 0	
}

//Precondition: Sum of all prime factors of all valid composites is passed in
//		to function
//Recursive calls take value from previous call
//Postcondition: Sum is collapsed into a single digit

func collapse(num int64) int64{
	
	//Set temp value for collapse to num parameter
	temp_collapse := num
	
	//Base Case: If num is a single digit, break recursion and return the current num
	if (num % 10) != num{
		
		//While num is not a single digit, add all digits of num and recursively
		//call collapse on that sum
		temp_collapse = 0
		
		for num % 10 != num{
			
			//num % 10 gives last digit of num, num/10 returns num witout
			//last digit
			temp_collapse += (num % 10)
			num = num/10
		}
	
		//add final digit to the collapse sum
		temp_collapse += num
		
		//recursive call of collapse
		temp_collapse = collapse(temp_collapse)

	}
			
	return temp_collapse

}


//Precondition: Collapse of sum of valid prime factors is passed into function
//Postcondition: Roman numeral corresponding to collapse is printed
func roman_numeral(n int64) string{
	//If collapse does not match a roman numeral from 1-9, N is printed
	switch n{
	case 1:
		return "I"
	case 2:
		return "II"
	case 3:
		return "III"
	case 4:
		return "IV"
	case 5:
		return "V"
	case 6:
		return "VI"
	case 7:
		return "VII"
	case 8:
		return "VIII"
	case 9:
		return "IX"
	default:
		return "N"
	}
}


//Main driver code
func main(){
	//Collecting lower and upper bounds from command line
	//assumes lower bound is entered first and upper bound second
	lower_bound, err:= strconv.ParseInt(os.Args[1], 10, 64)
	upper_bound, err := strconv.ParseInt(os.Args[2], 10, 64)
	_ = err

	var collapse_sum int64	
	//variable for storing sum of primes
	var sum int64
	
	//counter for number of composites with 2 unique prime factors
	var valid_count int64
	
	//array for storing prime factors of composites with unique in range of upper and lower bounds
	var valid_primes[] int64

	//array for storing all prime factors in upper and lower bounds
	var prime_factors[] int64


	

	var j int64
	var i int64	
	//Determining which composites in range are valid using prime factorization
	//checking for composites with only two unique prime factors
	//for loops upper bound is exclusive, so loops to upper bound + 1
	for i = lower_bound; i < upper_bound + 1; i++{
			
		//If value in composite vector is one, perform factorization on that index
		if gen_composites(i) == 1{
			
			target_composite := i
					
			prime_factors = nil	
			//Perform prime factorization on target composite
			//loop from 2 to squareroot of composite
			root := int64(math.Ceil(math.Sqrt(float64(i))))
			for j = 2; j < root; j++ {
				
				if  target_composite != 1{
					
					for target_composite % j == 0{
						
						if len(prime_factors) < 4{
							prime_factors = append(prime_factors, j)
							target_composite = target_composite / j
												
						}else{
							break
						}		
					}	
				}
			
			}
					
				
			//if last factor is prime, append to prime_factors
			if gen_composites(target_composite) == 0{
				prime_factors = append(prime_factors, target_composite)
			} 		
			
			//If array of prime facotrs contains 2 values that are unique, add those factors to array
			//of all valid prime factors and increment count of valid composites		
			if len(prime_factors) == 2 && prime_factors[0] != prime_factors[1]{
				valid_primes = append(valid_primes, prime_factors[0])
				valid_primes = append(valid_primes, prime_factors[1])
				valid_count += 1
				
			}
		}
	}
	
	for i := 0; i < len(valid_primes); i++{
		sum += valid_primes[i]
	}	

	if len(valid_primes) > 0{
		collapse_sum = collapse(sum)
	}
	
		
	fmt.Println("Count:", valid_count)
	fmt.Println("Sum:", sum)
	fmt.Println("Collapse:", collapse_sum)
	fmt.Println("Roman:", roman_numeral(collapse_sum))				
	fmt.Println("Hail Caesar!")	
	


}	


