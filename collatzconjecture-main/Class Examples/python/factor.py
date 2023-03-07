#!/usr/bin/python3

def recur(n):
	if n == 1:
		return n
	else:
		return n*recur(n-1)	
num = 1
num = int(input("Enter A Number: " ))

if num < 0:
        print("Factorial Does Not Exist.")
elif num == 0:
        print(1)
else:
        print(recur(num))




