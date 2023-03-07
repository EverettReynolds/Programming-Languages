#!/usr/bin/python3

import math
import sys

## Scriping Languages allow you to compile and run at one time


def primeGen(number): # A method which generates all numbers up to an input, and checks to see if their are odd and prime before being added to a List
	temp = []
	check = True 
	example = 0
	for i in range(1,number,1):
		check = True
		example = i
		for j in range(2,i,1):
			if(example % j == 0):
				check = False
		if(check == True and i%2 == 1):
			temp.append(i)
	return temp; 







def normMath(i,j,k): # The Norm Math Calculations
	res = 0.0
	res = (i*i)+(j*j)+(k*k)
	return math.sqrt(res)






def goldBachMath(number,primes): # Every combination of prime numbers that equal a user inputted is found using this method and added to a list
	combos = []
	checkK = 0
	diff = 0
	Sum = 0
	for i in range(0,len(primes),1): 
		for j in range(0,len(primes),1):
			Sum = primes[i] + primes[j]
			diff = number - Sum
			try: # when using index in python, errors are thrown if the value is not found within the list. To get around this, a try catch which executes the same code but simulates what would be done in java or C# to get around said error
				checkK = primes.index(diff)
				print(checkK)
				if( diff in primes and primes[i] < primes[j] and primes[j] < primes[checkK]): 
					combos.append(primes[i]) # every 3 slots is a new number combination
					combos.append(primes[j])
					combos.append(primes[checkK])

			except ValueError:
				checkK = -1
				print(checkK)
				if( diff in primes and primes[i] < primes[j] and primes[j] < primes[checkK]):
					combos.append(primes[i])
					combos.append(primes[j])
					combos.append(primes[checkK])
					
			
		
	return combos

	





# The Actual Driver for The Program

primes = []
goldenNums = []
norms = []
finalNums = []
userInput = input ("Enter Your Desired Number:")
number = int(userInput)
if( number <= 7 or number % 2 == 0):
	print("Error: Your Number Was Not Greater Than 7 or Not Odd. Exiting Now..")
	sys.exit(0) # This command sends a signal to the assembler to terminate the program
else:
	
	primes = primeGen(number)
	print(primes)
	goldenNums = goldBachMath(number,primes)
	count = 0
	slot = 0.0
 
	for i in range(0,len(goldenNums),3): #Here, We are grabbing the calculated number pairs and finding their norms. The Len and range functions come in handy as a way to get the size of a list and control a for loop respectively
		slot = normMath(goldenNums[i],goldenNums[i+1],goldenNums[i+2])
		norms.insert(count,slot)
		count = count + 1
finalNums.insert(0,goldenNums[0])
finalNums.insert(1,goldenNums[1])
finalNums.insert(2,goldenNums[2])

for i in range(0,len(norms),1): #searching for the correct final number pair 
	for j in range(i+1,len(norms),1):
		if(norms[i] > norms[j]):
			finalNums[0] = goldenNums[j*3]
			finalNums[1] = goldenNums[(j*3)+1]
			finalNums[2] = goldenNums[(j*3)+2]

		
print(number, " : ",finalNums) #Here we are outputting our finalNums to where our console spits out the final triplet



