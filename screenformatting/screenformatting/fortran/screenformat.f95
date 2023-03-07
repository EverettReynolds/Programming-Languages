    program screenformat
      interface
        subroutine fileread(long_string,size)
          character(:), allocatable :: long_string
          integer :: size
        end subroutine fileread
      end interface
      
      
      
      
      
      character(:), allocatable :: long_string
      character (LEN=1) :: input
      integer :: counter
      integer :: size
      call fileread(long_string, size)
      print *, long_string
      print *, "123456789*123456789*123456789*123456789*123456789*123456789*123456789*123456789*"
      print *, "Read ", counter, " characters."


    end program screenformat

    
     function format(input) result(formatted)
      character(*),intent(in) :: input
      character(:),allocatable :: formatted
      character(:),allocatable :: temp
      character(:),allocatable :: endString
      integer :: index
      integer :: mark
    end function format
    
    
    
    
    subroutine fileread(string,size)
      character(:),allocatable::string
      character(100)::file
      character(LEN=1)::in
      integer::count
      integer::size

       open(unit=5,status="old",access="direct",form="unformatted",recl=1,file="/pub/pounds/CSC330/translations/KJV.txt")
       counter=1
       100 read (5,rec=count,err=200) input
        if(iachar(in) == 10) then
          in = " "
        endif
        counter=counter+1
        goto 100
        200 continue
        counter=counter-1
        close(5)
    end subroutine fileread

   