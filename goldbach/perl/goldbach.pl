#!/usr/bin/perl
use strict;
use warnings;
#use List::Util qw(first);
## Scriping Languages allow you to compile and run at one time

my $number = 0;
my @primes = ();
my @goldenNums = (); # most variables I declared here so the compiler would stop telling me they weren't initialized when they were.
my @finalNums = ();
my @norms = ();
my $counter = 0;
my $normSize = 0;


# The Actual Driver for The Program

print "Enter a Number:";
$number  = <STDIN>;

if($number <= 7 or  $number % 2 == 0)
{
	print "Error: Your Number Was Not Greater Than 7 or Not Odd. Exiting Now..\n";
	exit(0) # This command sends a signal to the assembler to terminate the program
}

else
{

	@primes = primeGen($number);	
#	print join(',', @primes);
	@goldenNums = goldBachMath($number,@primes);
#	print join(',',@goldenNums);
	my $goldSize = @goldenNums;
	my $slot = 0.0;
	my $a = 0;
	my $i = 0;
	my $j = 0;
	for($a = 0; $a < $goldSize; $a =$a + 3) #Here, We are grabbing the calculated number pairs and finding their norms. 
	{
		$slot = normMath($goldenNums[$a],$goldenNums[$a+1],$goldenNums[$a+2]);
		push(@norms,$slot);
		$counter = $counter + 1;
	}
#	print join(',', @norms);
	push(@finalNums,$goldenNums[0]);
	push(@finalNums,$goldenNums[1]);
	push(@finalNums,$goldenNums[2]);
	$normSize = @norms; # instead of size variable being direct, many times size had to be put in a seperate variable to be used in a for loop

	
	for($i = 0; $i < $normSize;$i = $i + 1)
	{
		for($j = $i+1; $j < $normSize; $j = $j + 1)   #searching for the correct final number pair
		{
			if($norms[$i] > $norms[$j])
			{
				$finalNums[0] = $goldenNums[$j*3];
				$finalNums[1] = $goldenNums[($j*3)+1];
				$finalNums[2] = $goldenNums[($j*3)+2];

			}
		}
	}
	print join(',',@finalNums); #Here we are outputting our finalNums to where our console spits out the final triplet
	print("\n");
		
}


sub primeGen # A method which generates all numbers up to an input, and checks to see if their are odd and prime before being added to a List
{
	my $nu = (@_);
#	print($nu);
	my @temp = ();
	my $check = 1; #true false value
	my $example = 0;
	my $i = 1;
	my $j = 2;
	for( $i  = 1; $i < $number;$i = $i + 1)
	{
		  $check = 1;
		  $example = $i;
		for( $j = 2; $j < $i; $j = $j +1)
		{
		#	print($example%$j);
			if($example %  $j == 0)
			{
				 $check = 0;
			}
		}
	if($check == 1 and $i % 2 == 1)
	{
		push(@temp,$i);	
	}

	}
	
	return @temp
}

sub normMath # The Norm Math Calculations
{
	my($x,$y,$z) = (@_);
	my $res = 0.0;
	$res = ($x*$x)+($y*$y)+($z*$z);
	return sqrt($res);
		

}

sub goldBachMath # Every combination of prime numbers that equal a user inputted is found using this method and added to a list
{

	my @combos = ();
	my $checkK = 0;
	my $diff = 0;
	my $sum = 0;
	my $i = 0;
	my $j = 0;
	my ($numb,@list) = (@_);
	my $primeSize = @list;

	for($i = 0; $i < $primeSize; $i = $i + 1)
	{
		for($j = 0; $j < $primeSize; $j = $j +1)
		{
			
			$sum  = $list[$i] + $list[$j];
			$diff = $numb - $sum;
			if ( grep (/^$diff$/, @list) ) #grep is a lovely function. We are looking to see if the diff value is present within the given Array
			{
				$checkK = $diff;
			}
			else
			{
				$checkK = -1;
			}
			if($checkK == $diff and  $list[$i] < $list[$j] and $list[$j] < $diff) # every 3 slots is a new number combination
			{
				push(@combos,($list[$i],$list[$j],$diff));
			}
		}		
	}
	return @combos

}


