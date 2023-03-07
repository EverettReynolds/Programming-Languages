using System;

public class Numlist 
{
    static public void Main ()
    {
        int number;
	int example;
	bool check;
        Console.WriteLine ("Enter a number:");
        String str  = Console.ReadLine();
        number = Convert.ToInt32(str);
	Console.WriteLine(2);
	for(int i = 3; i < number; i++)
        {
	check = true;
	example = i;        
        for (int j=2; j<i; j++) {
	   if(example % j == 0)
	   {
	  //  Console.WriteLine("Mod Result: ");
	   // Console.WriteLine(example%j);
            check = false;
	   }
	//Console.WriteLine("Loop Ran ");
	  
        }
	if(check == true)
	{
	//	Console.WriteLine("Check was True Number:  ");
		Console.WriteLine(i);
	}

	}
    }
}
