       program composite

        implicit none



        integer, parameter      :: len_max = 256
        integer(kind = 16)       :: i , nargs, j
        integer(kind = 16)         :: compositeCount
        integer(kind = 16)         :: targetComposite
        integer(kind = 16)         :: lowerBound,upperBound
        character(100)  :: lowerChar,upperChar
       ! real, dimension (:), allocatable :: primeNums
        integer(kind = 16), dimension (2) :: primeFactors
       ! real, dimension (:), allocatable :: tempNums, tempFactors
        character (len_max)     :: arg

        integer         :: counter = 0
        integer(kind = 16)         :: factorSum = 0
        integer(kind = 16)         :: validCount = 0
        integer(kind = 16)         :: collapseSum = 0
 
        !nargs = command_argument_count()
        !nargs = iargc()
        !do i = 0, nargs
        !call get_command_argument (i, arg)
        !call getarg (i, arg)
        !write (*, '(a)') trim (arg)
        !end do
 
        if(command_argument_count() >= 3 .OR. command_argument_count() < 2) THEN
                WRITE(*,*)' ERROR, Only Two Command Line Arguments. , Retry Please. '
                STOP
        end if
        call get_command_argument (1,lowerChar)
        call get_command_argument (2,upperChar)
        READ(lowerChar,*)lowerBound
        READ(upperChar,*)upperBound

   

        do i = lowerBound, upperBound
                if( compCheck(i) .eqv. .TRUE. ) then
                        targetComposite = i
                        primeFactors(1) = 0
                        primeFactors(2) = 0
                        counter = 0
                       ! print *, targetComposite
                     
                        do j = 2, INT(SQRT(REAL(i)))
                                do while(mod(targetComposite,j) == 0 .and. counter < 3)
                                        targetComposite = targetComposite / j
                                        counter = counter + 1
                                         primeFactors(counter) = j
                                       
                                      !  print *, "Count ", counter

                                end do
                        end do

                     !   print *, "blah"
                        if(compCheck(targetComposite) .eqv. .FALSE. .and. counter < 2) then
                      !          print *, "QQQQQQQ"
                                primeFactors(2) = targetComposite
                                counter = counter + 1
 !                               print *, "First: ", primeFactors(1)
!                                print *, "Second:", primeFactors(2)
                        end if
 
           
                        if( counter == 2 .and. (primeFactors(1) /= primeFactors(2))) then
             
                                factorSum = factorSum + primeFactors(1) + primeFactors(2)
                                validCount = validCount + 1
             
                        end if
                end if
               
        end do

 
        collapseSum = collapse(factorSum)

        write(*,"(*(g0))") "Count: ", validcount
 
        write(*,"(*(g0))") "Sum: ", factorSum
 
        write(*,"(*(g0))") "Collapse:  ", collapseSum

        write(*,"(*(g0))") "Roman: ", romancode(collapseSum)



        print *," -- Hail Caesar!"
 
        contains



        function romanCode (n) result (romCode)
        IMPLICIT NONE
 
        integer(kind = 16), intent (in) :: n
        character(:), allocatable :: romcode

        if(n == 1) then
                romCode = "I"
        else if(n == 2) then
                romCode = "II"
        else if(n == 3) then
                romCode =  "III"
        else if(n == 4) then
                romCode = "IV"
        else if(n == 5) then
                romcode = "V"
        else if(n == 6) then
                romCode = "VI"
        else if(n == 7) then
                romCode = "VII"
        else if(n == 8) then
                romCode = "VIII"
        else if(n == 9) then
                romCode = "IX"
        else
                romcode = "N"
        end if
        end function romanCode
       




        logical function compCheck(x)
        integer(kind = 16), intent (in)    :: x
        integer                 :: loopCount

        loopCount = 5
        compCheck = .FALSE.

        if( x == 2 .or. x == 3) then
                compCheck = .FALSE.
                return
        end if

        if(x <= 1 .or. mod(x,2) == 0 .or. mod(x,3) == 0 ) then
                compCheck = .TRUE.
                return
        end if

        do while(loopCount*loopCount <= x)

                if( mod(x,loopCount) == 0 .or. mod(x,loopCount+2) == 0) then
                        compCheck = .TRUE.
                        return
                end if
                loopCount = loopCount + 6
        end do
        return
        end function compCheck


        recursive function collapse (num) result (res)
        implicit none
        integer(kind = 16), intent (in) :: num
        integer(kind =16)              :: tempNum
        integer(kind = 16)              :: res
        integer(kind = 16)              :: tempCollapse

        tempCollapse = num
        tempNum = num
       
        if(mod(tempNum,10) /= tempNum) then
                tempCollapse = 0
                do while( mod(tempNum,10) /= tempNum )
                        tempCollapse = tempCollapse + mod(tempNum,10)
                        tempNum = tempNum / 10
                end do
                tempCollapse = tempCollapse + tempNum
                tempCollapse = collapse(tempCollapse)
        end if

        res = tempCollapse
       
        end function collapse

        end program composite
