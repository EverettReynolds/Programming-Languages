#include <stdio.h>


int isPrime(int eval) // This is Secretly a Boolean Function disguised as an int function that only returns 0 and 1 to denote false and true respectively
{
	int flag  = 1;
		
	for(int j = 2; j < eval; j++ )
	{
		if(eval % j  == 0 )
		{
			flag = 0;
		}
	}
	return flag;
}


void printPrime(int num)
{

	for(int i = 2; i < num; i++ )
	{
		if(isPrime(i) == 1)
		{

			printf(" %d\n", i);		

		}
	}

}


int main()
{
	int num;

	printf("Enter Your Desired Number for Prime Check. ");
	scanf("%d",&num);
	printPrime(num);

	return 0;

}






