package main
import "fmt"

func main(){
	var x,y,inputL,inputU int64
	var highest int64 // comparison variable for highest number

	x = 0
	y = 0 // this is what im looking for
	fmt.Println("Enter The Lower Limit: ")
	fmt.Scan(&inputL)
	fmt.Println("Enter The Upper Limit: ")
	fmt.Scan(&inputU)
	// Goes from 2 to a number input, computing collatz calculations, then comparing their increment numbers
	for y = inputL; y <= inputU; y++{
		x = y
		
		
		for x > 1{
			if x % 2 == 0{
				x /= 2
			}else{
				x = (x * 3) + 1
			}
			//fmt.Println(x)
			if x > highest{
		    highest = x
		    }
		}
		
	}
	fmt.Println("The Highest Number Between ", inputL, "And ", inputU, "Is: ", highest)

}
// Selection Sort was Chosen as it was the easiest to implement
