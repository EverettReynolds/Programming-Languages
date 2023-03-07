#!/usr/bin/python3

num = 1
factorial = 1
num = int(input("Enter A Number: " ))

if num < 0:
	print("Factorial Does Not Exist.")
elif num == 0:
	print(1)
else:
	for i in range(1,num+1):
		factorial = factorial*i
	print(factorial)	


