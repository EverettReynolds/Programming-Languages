#!/usr/bin/julia

function main()
x::Int64 = 0
y::Int64 = 1
inputL::Int64 = 0
inputU::Int64 = 0
highest::Int64 = 0

print("Enter The Lower Limit: ")
    inputL = parse(Int64,readline())
print("Enter The Upper Limit: ")
    inputU = parse(Int64,readline())

y = inputL
for y in inputL:inputU
        
        x = y
        while x > 1
            if x % 2 == 0
               x = fld(x,2)
            else
                x = (x*3) + 1
            end
        #  print(x) 
	   if x > highest
		highest = x
	   end
        end
end

	println("The Highest Value Between ", inputL, " And ", inputU, " Is: ", highest )

end


main()
exit(0)
