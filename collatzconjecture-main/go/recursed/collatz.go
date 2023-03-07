package main
import "fmt"

func main(){
	largeLengths := [] int64{0,0,0,0,0,0,0,0,0,0}
	largeValues := [] int64{0,0,0,0,0,0,0,0,0,0}
	var increment,x,y,z int64

	x = 0
	y = 0
	fmt.Println("Enter The Upper Limit: ")
	fmt.Scan(&z)
	// Goes from 2 to a number input, computing collatz calculations, then comparing their increment numbers recursively through the collatz length function
	for y = 2; y < z; y++{
		x = y
		increment = collatzLength(x)
		// If the smallest value in lengths is smaller than the recently found increment value, it is placed into Lengths
		if increment > largeLengths[0]{
			if !within(largeLengths,increment){
				largeLengths[0] = increment
				largeValues[0] = y
				selSort(largeLengths,largeValues)
			}
		}
	}

	fmt.Println("Sort By Ascending Length")
	for b := 0; b < 10; b++{
		fmt.Println("The Floor of ", largeValues[b] , " Has " , largeLengths[b], "Steps To 1.")
	}
	// Re-sort is needed to compare Length and Number Values, hence two arrays having identical data
	selSort(largeValues,largeLengths)
	fmt.Println(" ")

	fmt.Println("Sort By Ascending Value")
	for b := 0; b < 10; b++{
		fmt.Println("The Floor of ", largeValues[b] , " Has " , largeLengths[b], "Steps To 1.")
	}
}
// Selection Sort was Chosen as it was the easiest to implement
func selSort(arr1 []int64 , arr2 []int64){
	minIndex := len(arr1) - 1
	for i := 0; i < minIndex; i++{
		arr1Min := arr1[i]
		arr2Min := arr2[i]
		iMin := i
		for j := i + 1; j < len(arr1); j++{
			if arr1[j] < arr1Min{
				arr1Min = arr1[j]
				arr2Min = arr2[j]
				iMin = j

			}
		}
	    arr1[i], arr1[iMin] = arr1Min, arr1[i]
		arr2[i], arr2[iMin] = arr2Min, arr2[i]
	}
}
// Mimics an Index of funtion from a language like Java. Takes in a token and array, and searches through the given array looking for that value
func within(arr []int64, token int64) bool{
	for i := 0; i < 10; i++{
		if arr[i] == token{
			return true
		}
	}
	return false
}
// Recursively calcuiates collatz lengths for a given input number
func collatzLength(number int64)int64{
 if number == 1{
    return 0   
 }else if number % 2 == 0{
    return 1 + collatzLength(number/2)        
}else{
    return 1 + collatzLength((number*3) + 1)
 }
}
