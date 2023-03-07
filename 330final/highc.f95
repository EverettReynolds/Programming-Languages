        program highc

        implicit NONE

        integer(kind=8):: x,y,inputL,inputU,higher
       

        interface

        recursive subroutine collatzLength(number, increment)
        integer(kind=8) :: number , increment
        end subroutine collatzLength        

        end interface
        



        print *, "Enter The Lower Limit: "
        read *, inputL
        print *, "Enter The Upper Limit: "
        read *, inputU
        y = inputL
        higher = 1

do while( y < inputU)
    x = y

    call collatzLength(x,higher)

    y = y + 1


end do

        print *, "The Highest Number Between ", inputL, " And " , inputU, " Is: ", higher

        end program highc

        recursive subroutine collatzLength(number, higher)
        integer(kind = 8) :: number , higher

        if (number == 1) then
        return
        else if ( mod(number,2) == 0) then
        if( number > higher) then
        higher = number
        end if
        call collatzLength(number/2, higher)
        
        return
        else
        if(number > higher) then
        higher = number
        end if
        call collatzLength(number * 3 + 1, higher)
        
        return

        end if

end subroutine collatzLength
        
