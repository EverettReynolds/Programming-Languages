#!/usr/bin/julia
 function selSort( largestLengths::Vector{Int64} , largestValues::Vector{Int64} )
    length = 10
    tmp = 0
    #if length < 2
        #return largestLengths, largestValues
    #end
    for i in 1:length-1
        lengthMin , j = findmin(largestLengths[i+1:end])
        valMin, k = findmin(largestValues[i+1:end])
        if lengthMin < largestLengths[i]
            tmp = largestLengths[i+j]
            largestLengths[i+j] = largestLengths[i]
            largestLengths[i] = tmp
            #largestLengths[i+j] = largestLengths[i]
            #largestValues[i+j] = getindex(largestLengths[i])
            #largestLengths[i] = lengthMin
            #largestValues[i] = getindex(largestLengths[i])
            #largestValues[i+j] = largestValues[i]
            #largestLengths[i] = lengthMin
            #largestValues[i] = lengthMin
           
        end
        if valMin < largestValues[i]
            tmp = largestValues[i+j]
            largestValues[i+j] = largestValues[i]
            largestValues[i] = tmp
           
        end
    end
    return largestLengths, largestValues
end 

function main()
    x::Int64 = 0
    y::Int64 = 1
    z::Int64 = 0
    increment::Int64 = 0
    largestLengths :: Vector{Int64} = [0,0,0,0,0,0,0,0,0,0]
    largestValues :: Vector{Int64} = [0,0,0,0,0,0,0,0,0,0]

    print("Enter The Upper Limit: ")
    z = parse(Int64,readline())

    while y < z
        increment = 0
        x = y
        while x != 1
            if x % 2 == 0
               x = fld(x,2)
            else
                x = (x*3) + 1
            end
            increment = increment + 1
        end
        #println("Number:" , y, " length: ", increment)
        if increment > largestLengths[1]
            # Thankfully Julia has a built in method which searches through arrays for you, eliminating my within method which was in other languages
            if( indexin(increment, largestLengths) .== nothing )
                largestLengths[1] = increment
                largestValues[1] = y
                #sort!(largestLengths)
                #sort!(largestValues)
                selSort(largestLengths,largestValues)
                #sortperm(largestLengths)
               # sortperm(largestValues)
            end
        end
        y = y + 1
    end

    println("Sort By Ascending Length")
    increment = 1
    while increment <= 10
        println(" The Floor of ", largestValues[increment], " has ", largestLengths[increment], " Steps to 1.")
        increment = increment + 1
    end
    selSort(largestValues,largestLengths)
    #sort(largestValues)
    #sort(largestLengths)
    println("Sort By Ascending Value")
    increment = 1
    while increment <= 10
        println(" The Floor of ", largestValues[increment], " has ", largestLengths[increment], " Steps to 1.")
        increment = increment + 1
    end
end

main() 
exit(0)