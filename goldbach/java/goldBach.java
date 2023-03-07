import java.util.*;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.List;
import java.lang.Math;

public class goldBach 
{
	// The Actual Driver for The Program
    public static void main(String args[])
    {
        int number;
	ArrayList<Integer> primes = new ArrayList <Integer>();
	ArrayList <Integer> goldenNums = new ArrayList<Integer>();
	ArrayList <Integer> finalNums = new ArrayList<Integer>();
        ArrayList<Double> norms = new ArrayList <Double>();
        Scanner input = new Scanner(System.in); 
        System.out.println("Enter a number:");
        String str  = input.nextLine();
        number = Integer.parseInt(str);
	      if(number <= 7 || number % 2 == 0 )
	      {
		      System.out.println("Error: Your Number Was Not Greater Than 7 or Not Odd. Exiting Now..");
		      System.exit(0); // This command sends a signal to the assembler to terminate the program
	      }
	      else
	      {
		     
		      primes = primeGen(number);
	        //	System.out.println(primes);	
	        goldenNums =  goldBachMath(number,primes); 
		      System.out.println(goldenNums);
		      int count = 0;
		      double slot = 0.0;
		      for(int i = 0; i < goldenNums.size(); i=i+3) // Here, We are grabbing the calculated number pairs and finding their norms
		      {
			      slot = normMath( goldenNums.get(i),goldenNums.get(i+1),goldenNums.get(i+2) );
			      norms.add(count,slot);
			      count++;
		      }
		      //System.out.println(norms);
		      finalNums.add(goldenNums.get(0));
		      finalNums.add(goldenNums.get(1));
		      finalNums.add(goldenNums.get(2));
 		      count = 0;

	
		      for(int i = 0; i < norms.size(); i++)
		      {
			      for(int j = i+1; j < norms.size(); j++)
			      {
				      if(norms.get(i) > norms.get(j) ) //searching for the correct final number pair 
				      {
					      finalNums.set(0,goldenNums.get(j*3) );
                			      finalNums.set(1,goldenNums.get( (j*3)+1) );
                			      finalNums.set(2,goldenNums.get( (j*3)+2) );
	
				}
			}
		}

		System.out.println(number + " : " + finalNums);
			
	}

			
}


	public static boolean isPrime(int number)
	{
	boolean check = true;
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
                //	System.out.println(i);
                				
                				                }
                
                				                              }
               				                              	return check;
               				                              		}
                


	public static ArrayList<Integer> primeGen(int number) // A method which generates all numbers up to an input, and checks to see if their are odd and prime before being added to a List
	{
	ArrayList<Integer>temp = new ArrayList<Integer>();
	boolean check;
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
            System.out.println(i);
            temp.add(i);
          }

        }
        return temp;
	

	}

	public static double normMath(double i,double j,double k) // The Norm Math Calculations
	{

		double res;
		res = (i*i)+(j*j)+(k*k);
		return Math.sqrt(res);	

			

	}

	public static ArrayList<Integer> goldBachMath(int number, ArrayList<Integer> primes) // Every combination of prime numbers that equal a user inputted is found using this method and added to a list
	{								
		ArrayList<Integer> combos = new ArrayList<Integer>();
		int checkK = 0;
		int diff = 0;
		int sum = 0;
		
		for(int i = 0; i < primes.size(); i++)
		{
			for(int j = 0; j < primes.size(); j++)
			{
				sum = primes.get(i) + primes.get(j);
				diff = number - sum;
				checkK = primes.indexOf(diff);
				if( /* primes.contains(diff)*/ isPrime(diff)  &&  primes.get(i)<primes.get(j)&& primes.get(j)<primes.get(checkK)  ) // every 3 slots is a new number combination
				{
					 combos.add(primes.get(i) );
           				 combos.add(primes.get(j) );
           				 combos.add(primes.get(primes.indexOf(diff)));
					 System.out.println(i);
				}			
			}
		}
	
		return combos;
	}

}

