using System;
using System.Collections;
using System.Collections.Generic;

public class goldbach 
{    // The Actual Driver for The Program
    static public void Main()
    {
        int number;
	      List <int> primes = new List <int>();
	      List <int> goldenNums = new List <int>(); // ArrayLists were effectivly phased out many versions ago, so the data type has changed
	      List <int>  finalNums = new List <int>();
        List <double> norms = new List<double>(); 
        Console.WriteLine("Enter a number:");
        String str = Console.ReadLine();
        number = Convert.ToInt32(str);
	if(number <= 7 || number % 2 == 0 )
	{
		Console.WriteLine("Error: Your Number Was Not Greater Than 7 or Not Odd. Exiting Now..");
		System.Environment.Exit(0); // This command sends a signal to the assembler to terminate the program
	}
	else
	      {
		    //  isPrime(number);
		      primes = primeGen(number);
	    //	System.out.println(primes);	
	        goldenNums =  goldBachMath(number,primes);
		      //System.out.println(goldenNums);
		      int count = 0;
		      double slot = 0.0;
		      for(int i = 0; i < goldenNums.Count; i=i+3) // Here, We are grabbing the calculated number pairs and finding their norms
		      {
			      slot = normMath(goldenNums[i],goldenNums[i+1],goldenNums[i+2] );
			      norms.Insert(count,slot);
			      count++;
		      }
		      //System.out.println(norms);
		      finalNums.Add(goldenNums[0]) ;
		      finalNums.Add(goldenNums[1]) ;
		      finalNums.Add(goldenNums[2]) ;

	
		      for(int i = 0; i < norms.Count; i++)
		      {
			      for(int j = i+1; j < norms.Count; j++)
			      {
				      if(norms[i] > norms[j] ) //searching for the correct final number pair
				      {
                finalNums[0] = goldenNums[j*3];                                                                
                finalNums[1] = goldenNums[(j*3)+1];
                finalNums[2] = goldenNums[(j*3)+2];
	
				      }
		      	}
		      }

		  Console.Write(number + " : ("); //Here we are outputting our finalNums to where our console spits out the final triplet
			for(int x = 0; x < finalNums.Count; x++)
      {
        Console.Write( finalNums[x] + ", ");
      }
      Console.WriteLine(")");
	     }


    }


    static public List<int> primeGen(int number) // A method which generates all numbers up to an input, and checks to see if their are odd and prime before being added to a List
	  {
	    List <int> temp = new List<int>();
	    bool check;
	    int example;
      for(int i = 1; i < number; i++)
      {
        check = true;
        example = i;
        for (int j=2; j<i; j++)
        {
          if(example % j == 0)
          {
            check = false;
          }
  
        }
        if(check == true && i%2 == 1)
        {
          //System.out.println(i);
          temp.Add(i);
        }

      }
      return temp;
	

   	}


    public static double normMath(double i,double j,double k) // The Norm Math Calculations
	  {

		  double res;
		  res = (i*i)+(j*j)+(k*k);
		  return Math.Sqrt(res);	

			

  	}
   
   static public List<int> goldBachMath(int number, List<int> primes) // Every combination of prime numbers that equal a user inputted is found using this method and added to a list
   {
		List <int> combos = new List<int> ();
		int checkK = 0;
		int diff = 0;
		int sum = 0;
		
		for(int i = 0; i < primes.Count; i++)
		{
			for(int j = 0; j < primes.Count; j++)
			{
				sum = primes[i] + primes[j];
				diff = number - sum;
				checkK = primes.IndexOf(diff);
				if( primes.Contains(diff)  && primes[i]<primes[j]&& primes[j]<primes[checkK]  ) // every 3 slots is a new number combination
				{
					 combos.Add(primes[i]);
           combos.Add(primes[j]);
           combos.Add(primes[primes.IndexOf(diff)]);
				}			
			}
		}
	
		return combos;
	}


}


