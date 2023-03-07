#!/usr/bin/julia

function factorial(n)
    if(n<=1)
        return 1
    else
        return n*factorial(n-1)
    end
end

println(factorial(parse(Int64,ARGS[1])))
exit(0)