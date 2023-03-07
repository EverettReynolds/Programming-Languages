program collatz

implicit NONE
!INTEGER(kind=8) :: intArray(10) = (/ 4, 9, 3, -2, 0, 7, -5, 1, 6, 8 /)
!INTEGER(kind=8) :: intArray2(10) = (/ 4, 9, 3, -2, 0, 7, -5, 1, 6, 8 /)
integer(kind = 8) :: x,y,tmp,increment,count
integer(kind = 8) :: largeLengths(10) = (/ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)
integer(kind = 8) :: largeValues(10) = (/ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0/)

interface

    subroutine selSort(arr1, arr2)
        integer(kind = 8), intent(in out) :: arr1(:)
        integer(kind = 8), intent(in out) :: arr2(:)
        integer(kind = 8):: tmp, x, minIndex
    end subroutine selSort

    recursive subroutine collatzLength(number, increment)
        integer(kind = 8) :: number , increment
    end subroutine collatzLength

    logical function within(arr, token) result(detected)
        integer(kind = 8), intent(in):: arr(:)
        integer(kind = 8) :: count, token
    end function within

end interface


print *, "Enter The Upper Limit: "
read *, tmp
count = 1
y = 1

do while( y < tmp)
    x = y
    increment = 0

    call collatzLength(x,increment)

    if( increment > largeLengths(1) ) then
        if (.not. within(largeLengths,increment) ) then
            largeLengths(1) = increment
            largeValues(1) = y
            call selSort(largeLengths,largeValues)
        end if
    end if
    y = y + 1


end do
    
print *, "Sort By Ascending Length"
count = 1
do while (count <= 10)
    print *, " The Floor of " , largeValues(count:count), " has ", largeLengths(count:count), " steps to 1."
    count = count + 1
end do

call selSort(largeValues,largeLengths)
print *, " "
print *, "Sort By Ascending Value"
count = 1

do while (count <= 10)
    print *, " The Floor of " , largeValues(count:count), " has ", largeLengths(count:count), " steps to 1."
    count = count + 1
end do


end program collatz


! Use two arrays to keep track of both different sort types at the end of the process of calculating collatz
! arr1 is list length, arr2 is magnitude
subroutine selSort(arr1, arr2)
    integer(kind = 8), intent(in out) :: arr1(:)
    integer(kind = 8), intent(in out) :: arr2(:)
    integer(kind = 8):: tmp, x, minIndex

    do x = 1, size(arr1) - 1
        minIndex = MINLOC(arr1(x: ) , 1 ) + x - 1
        if(arr1(x) > arr1(minIndex)) then
            tmp = arr1(x)
            arr1(x) = arr1(minIndex)
            arr1(minIndex) = tmp

            tmp = arr2(x)
            arr2(x) = arr2(minIndex)
            arr2(minIndex) = tmp

        end if
    end do
end subroutine selSort

! This Recursive Function Does What The Iterative One Did
! A Number is passed in and a sequence length is gotten through the input

recursive subroutine collatzLength(number, increment)
    integer(kind = 8) :: number , increment

    if (number == 1) then
        return
    else if ( mod(number,2) == 0) then
        call collatzLength(number/2, increment)
        increment = increment + 1
        return
    else
        call collatzLength(number * 3 + 1, increment)
        increment = increment + 1
        return

    end if

end subroutine collatzLength

! Returns true if a given value is found within a given array. Returns false if not found.
logical function within(arr, token) result(detected)
    integer(kind = 8), intent(in):: arr(:)
    integer(kind = 8) :: count, token
    detected = .false.
    count = 1

    do while(count <= 10)

        if(arr(count) == token ) then
            detected = .true.
            exit
        end if

        count = count + 1
    end do

end function within

