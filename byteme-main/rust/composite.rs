#![recursion_limit="20000"]
use std::env;

//Precondition: Integer is passed in through main loop of program
//Postcondition: Returns boolean indicating if input value is composite
fn is_composite(num:i128) -> bool
{
	//Uses primality test to check if input value is composite

	//Variable for while loop to check primality of input value
	let mut loop_counter: i128 = 5;

	//If input value is 2 or 3, return false
	if num == 2 || num == 3 {
		return false;
	}
	
	//If input value is even or divisible by 3, return true
	if num <= 1 || num % 2 == 0 || num % 3 == 0 {
		return true;
	}

	//Test if input value has factors other than itself and 1. If so, return true
	while loop_counter.pow(2) <= num {

		if num % loop_counter == 0 || num % (loop_counter + 2) == 0 {
			return true;
		}

		loop_counter += 6;
	}

	//If all previous tests fail, return false
	return false;
}

//Precondition: Sum of all prime factors of valid composites is passed in to function
//Recursive calls take value from previous call
//Postcondition: Sum is collapsed into a single digit
fn collapse(mut num: i128)->i128 {

	//Set temp value for collapse to num parameter
	let mut temp_collapse:i128 = num;

	//Base case: If num is a single digit, stop recursion and return current num
	if num % 10 != num {

		//While num is not a single digit, add all digits of num and recursively
		//call collapse on that sum
		temp_collapse = 0;
		while num % 10 != num {
			//num % 10 gives last digit of num, num / 10 returns num w/o last digit
			temp_collapse += num % 10;
			num = num / 10;
		}
		//Add final digit (first digit of the initial num) to the collapse sum
		temp_collapse += num;	

		//Recursive call of collapse
		temp_collapse = collapse(temp_collapse);
	}
	
	//Returning collapse sum
	return temp_collapse;
}

//Precondition: Collapse of sum of valid prime factors is passed into function
//Postcondition: Roman numeral corresponding to collapse is printed
fn roman_numeral(num: i128) {
	//Roman numeral equivalent to collapse sum is printed
	//If collapse does not match a roman numeral from 1 - 9, prints N
	match num {
	1=> println!("Roman: I"),
	2=> println!("Roman: II"),
	3=> println!("Roman: III"),
	4=> println!("Roman: IV"),
	5=> println!("Roman: V"),
	6=> println!("Roman: VI"),
	7=> println!("Roman: VII"),
	8=> println!("Roman: VIII"),
	9=> println!("Roman: IX"),
	_=> println!("Roman: N"),
	}
}

//Main driver code
fn main()
{
	//Collecting command line arguments and setting lower and upper bounds
	//Assumes lower bound is entered first and upper bound is entered second
	let args: Vec<String> = env::args().collect();
	let lower_bound: i128 = args[1].parse().unwrap();
	let upper_bound: i128 = args[2].parse().unwrap();

	//Counter for the number of composites in range w/ two unique prime factors
	let mut valid_count: i32 = 0;	

	//Vector for storing prime factors of every valid composite w/ two unique prime factors
	let mut valid_primes = vec![0;0];

	//Variable for storing composite to perform factorization on
	let mut target_composite: i128 ;

	//Vector for storing all the prime factors of a given composite in given range
	let mut prime_factors = vec![0;0];

	//Determining which composites in range are valid using prime factorization and
	//checking for those with only two unique prime factors
	//For loop's upper bound is exclusive, so running from lower_bound to upper_bound + 1
	for i in lower_bound..upper_bound+1 {
	
		//If value in range is composite, sets it as target to perform prime factorization on
		if is_composite(i) == true {
			target_composite = i;	

			//Emptying vector of prime factors for storing target composite's prime factors
			while !prime_factors.is_empty() {
				prime_factors.pop();
			}

			//Perform prime factorization on target composite
			for j in 2..upper_bound {

				//If vector of prime factors contains 3 factors, conditions have not been met, so
				//end factorization
				while target_composite % j == 0 && prime_factors.len() < 4 {
					target_composite = target_composite / j;

					//Add factor to vector of prime factors
					prime_factors.push(j);
				}
			}

			//If vector of prime factors contains 2 values that are unique, add those factors to vector
			//of all valid prime factors and increment count of valid composites
			if prime_factors.len() == 2 && prime_factors[0] != prime_factors[1] {
				valid_primes.push(prime_factors[0]);
				valid_primes.push(prime_factors[1]);
				valid_count += 1;
			}
		}
	} 

	//Value for storing sum of all valid prime factors
	let mut sum: i128 = 0;

	//Sum all valid prime factors in vector
	for i in 0..valid_primes.len() {
		sum += valid_primes[(i as usize)];
	}
	
	//Print count and sum of valid prime factors
	println!("Count: {:?}", valid_count);
	println!("Sum: {:?}", sum);

	//Variable for storing collapse of sum of prime factors
	let mut collapse_sum: i128 = 0;
	
	//If there are any valid primes, perform collapse on sum
	if valid_primes.len() > 0 {
		collapse_sum = collapse(sum);
	}

	//Printing collapse of sum of prime factors
	println!("Collapse: {:?}", collapse_sum);

	//Printing roman numeral corresponding to collapse
	roman_numeral(collapse_sum);

	//Printing "Hail Caesar!"
	println!("\t-- Hail Caesar!");	
}

