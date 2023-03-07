#!/usr/bin/julia

#function returns boolean based on if input is composite
function is_composite(num)

    loop_counter = 5 #while loop variable

    #if input value is 2 or 3 return false(0)
    if (num == 2 || num == 3 )
      return 0
    end

    #if input value is even or divisible by 3 return true(1)
    if ( num <= 1 || num % 2 == 0 || num % 3 == 0)
      return 1
    end
    #if input value is prime return true(1)
    while loop_counter ^ 2 <= num
        if(num % loop_counter == 0 || num % (loop_counter + 2) == 0)
            return 1
        end
	loop_counter = loop_counter + 6
    end
    #if tests fail return false(0)
    return 0
end

#recursive call from value of previous call
#takes prime factors of composite value
#values are collapsed into a single digit
function collapse(num)
        num = floor(num / 10)
        temp_collapse = num
        if num % 10 != num
                temp_collapse = 0
                while num % 10 != num
                        temp_collapse += num % 10
                        num = num / 10
                end
                temp_collapse += num
                temp_collapse = collapse(temp_collapse)
        end
        return temp_collapse
end

#collapsed numberr is passed in
function roman_numerals(num)
  #prints corresponding roman numeral to sum
  if(num == 1)
    println("Roman: I")
  elseif(num == 2)
    println("Roman: II")
  elseif(num == 3)
    println("Roman: II")
  elseif(num == 4)
    println("Roman: IV")
  elseif(num == 5)
    println("Roman: V")
  elseif(num == 6)
    println("Roman: VI")
  elseif(num == 7)
    println("Roman: VII")
  elseif(num == 8)
    println("Roman: VIII")
  elseif(num == 9)
    println("Roman: IX")
  else
    println("Roman: N")
  end
end

#main algorithm of function

  #input as upper and lower bounds
  lower_bound = parse(Int64,ARGS[1])
  upper_bound = parse(Int64,ARGS[2])

  #store all valid prime factors
  collapse_sum = 0
  #store collapse of sum of prime factors
  sum = 0 

  #stores prime factors of every valid composite that has two unique prime factors
  global valid_primes = []
  #stores all the prime factors of a given composite in the given bounds
  global prime_factors = []

  global valid_count = 0

  i = 0
  j = 0

  #Determines which composites in range are valid using prime factorization and
	#checking for those with only two unique prime factors
  #from lower bound to upper bound
  for i in lower_bound:upper_bound
        if (is_composite(i) == 1)
                target_composite = i
                #empties the vector
                while !isempty(prime_factors)
                        pop!(prime_factors)
                end
                #loop for prime factorization
                for j in 2:sqrt(i)
                        while target_composite%j == 0 && length(prime_factors) < 4
                                target_composite = target_composite / j
                                push!(prime_factors,j)
                        end
                end
		if is_composite(target_composite) == 0
			push!(prime_factors, target_composite)
		end
                #If vector of prime factors contains two unique values add those factors to vector of
                #all valid prime factors and increment count of valid composites
                if length(prime_factors) == 2 && prime_factors[1] != prime_factors[2]
                        push!(valid_primes,prime_factors[1])
                        push!(valid_primes,prime_factors[2])
                        global valid_count = valid_count + 1
                end
        end
end
#sums all of the prime factors into array
for i in 1:length(valid_primes)
	global sum += valid_primes[i]
end

	println("Count:",valid_count)
	println("Sum:",sum)
	
#does collapse if on sums if there are valid primes  
if(length(valid_primes) > 0)
  collapse_sum = collapse(sum)
end

println("Collapse: ",floor(collapse_sum))
roman_numerals(floor(collapse_sum))
println("\t-- Hail Caesar!")


exit(0)
 
