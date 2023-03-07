#!/usr/bin/python3
count = 0
i = int(input("Enter a Number:") )
while i != 1:
    print(int(i))
    count = count + 1	
    if ( i % 2  == 0 ):
        i = i / 2
    else:
        i = i * 3 + 1

print ( int(i) )
print ("Number of Integers in Sequence:" + str(count) )
