

        program number

        integer::num

        read *,num
        call printPrime(num)


        end program number


        subroutine printPrime(num)
        integer :: number
        logical:: prime
        logical:: isPrime
        

        
        do i = 2,num,1
                if( isPrime(i) .eqv. .TRUE. ) THEN
                print *,i
        end IF
        end do
        end subroutine printPrime
        
        LOGICAL FUNCTION isPrime(potenPrime)
        integer::potenPrime
        logical::primeNumber        
        isPrime  = .True. 
        
        
        do j = 2,potenPrime-1,1
                if( mod(potenPrime,j) == 0 ) THEN
                        isPrime  = .FALSE.
                end IF 
        end do
        
                     
        END FUNCTION isPrime


