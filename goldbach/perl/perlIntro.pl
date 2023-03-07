#!/usr/bin/perl


my $num; 

for( $a = 1; $a < 101; $a = $a + 1)
{

	print "$a\n";

}

print "Enter an Integer.";
my $userInput = <STDIN>;

for($a = 1; $a < $userInput+1; $a = $a + 1)
{

      # print "$a\n";
      #	prime($a);
}

#prime2($userInput);

#prime($userInput);
prime1($userInput);
#prime2($userInput);

#primeNum($userInput);

sub primeNum
{

	my $num = (@_);
	my $tf = 1;
	for(my $a = 2; $a < $num; $a = $a + 1)
	{
		if($num % $a == 0)
		{
			$tf = 0;
		}
		if($tf == 1)
		{
			print $a;
		}
	}

}





sub prime
{

	$num = (@_);
	$count = 0;
	for( $a = 1; $a < $num; $a = $a + 1)
	{
		if($num % $a == 0)
		{
			print $a;
			$count = $count + 1;

			
		} 
		if($count > 2)
		{
			break;
		}

		
	}


}



sub prime1
{
	$num = (@_[0]);
      my $count = 0;

	for($a = 2; $a < $num+1; $a = $a + 1)
	{


	for($b = $num; $b >1; $b = $b - 1)
	{
		if($num % $b == 0)
                {
                	$count = $count + 1;

		}
		if($count < 3)
	        {
                print $a;
       		 }

       }
	if($count < 3)
         {
         print $a;                
	}
	
#	if($count < 3)
 #       {
  #              print $a;
   #     }

	}
	



	

} 




sub prime2
{
        $num = (@_);


        for($a = 1; $a < $num+1; $a = $a + 1)
        {
                $count = 1;
                for($b = 2; $b < sqrt($a)+1; $b = $b + 1)
                {
                        if($a % $b == 0)
                        {
                                $count = 0;
                                break;
                        }
                }
                if($count == 1)
                {
                        print $a;
                }
        }


}


