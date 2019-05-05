import UIKit


func loopPower(power pow: Int,base b: Int )->Int
{
    var result = 1 ;
    if pow == 0{ return 1}
    else{
    for _ in 1...pow
    {
        result*=b
    }
    return result
    }
    
}
print (loopPower(power :3,base:  2))


//loop recursion
func loopRecursion(base x: Int,power n: Int )-> Int
{
    var m = 1
    if n == 0{ return 1}
    if n % 2 == 0 {
        m = loopRecursion(base: x, power: n / 2);
        return m * m;
    } else
    {return x * loopRecursion(base: x, power: n - 1)}
    

}
print (loopRecursion(base :2,power:  3))

// factorial
func factorial(number n: Int) -> Int {
    if n == 0 {
        return 1
    }
    else {
        return n * factorial(number: n - 1)
    }
}

print( factorial(number :2) )

// sort array
var intArray = [34,13,14,584,1,34,69,3,596,2]
var result = intArray.sorted()

print(result)


// swap
func swap(number1 : inout Int , number2 : inout Int){
    let temp = number1
    number1 = number2
    number2 = temp
}
var number1 = 5
var number2 = 6
swap(&number1, &number2)

print("number1 is ",number1)
print("number2 is " , number2)

// min max

func minMax(array: [Int])->(min :   Int , max: Int)?{
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count]{
        if value<currentMin{
            currentMin = value
        }
        else if value>currentMax{
            currentMax = value
        }
    }
    return (currentMin , currentMax)
}
var minMaxArray = [34,13,14,584,1,34,69,3,596,2]
print(minMax(array: minMaxArray)!)



