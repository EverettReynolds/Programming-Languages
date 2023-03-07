#!/usr/bin/python3

def isPrime(res):
	flag = True
	for j in range(2,res):
		if(res % j == 0):
			flag = False;
	return flag
	






def printNums(num):
	for i in range(2, num):
		if ( isPrime(i) == True ):
			print(i)




userInput = input ("Enter Your Desired Integer:")
num = int(userInput)
printNums(num)

	




