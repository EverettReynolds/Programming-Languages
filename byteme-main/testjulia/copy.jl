#!/usr/bin/julia

function is_composite(num)
    loop_counter = 5;
    if (num == 2 || num == 3 )
      return 0
    end
    if ( num <= 1 || num % 2 == 0 || num % 3 == 0)
      return 1
    end
    while loop_counter ^2 <= num
        if(num % loop_counter == 0 || num % (loop_counter + 2) == 0)
            return 1
        end
    end
end

function collapse(num)
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

function roman_numerals(num)
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

  lower_bound = parse(Int64,ARGS[1])
  upper_bound = parse(Int64,ARGS[2])

  collapse_sum = 0
  sum = 0 

  global valid_primes = []
  global prime_factors = []

  global valid_count = 0

  i = 0
  j = 0


  for i in lower_bound:upper_bound+1

        compositevar = is_composite(i)
        if (compositevar == 1)
                target_composite = i

                while !isempty(prime_factors)
                        pop!(prime_factors)
                end

                for j in 2:upper_bound
                        while target_composite%j == 0 && length(prime_factors) < 4
                                target_composite = target_composite / j

                                push!(prime_factors,j)
                        end
                end

                if length(prime_factors) == 2 && prime_factors[1] != prime_factors[2]
                        push!(valid_primes,prime_factors[1])
                        push!(valid_primes,prime_factors[2])
                        global valid_count = valid_count + 1
                end

        end
end



sum = 0

for i in 1:length(valid_primes)
	global sum += valid_primes[i]
end
	println("Count:",valid_count)
	println("Sum:",sum)
	

collapse_sum = 0



if(length(valid_primes) > 0)
  collapse_sum = collapse(sum)
end

println("Collapse: ",floor(collapse_sum))
roman_numerals(floor(collapse_sum))
println("\t-- Hail Caesar!")


exit(0)
 
