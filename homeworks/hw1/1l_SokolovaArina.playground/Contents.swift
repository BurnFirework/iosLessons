import Foundation

//1
let a: Double = 1
let b: Double = 10 
let c: Double = -40 //data
let discriminant = b * b - 4 * a * c
if (discriminant > 0 && a != 0) {
    print((-b + sqrt(discriminant)) / (2 * a), (-b - sqrt(discriminant)) / (2 * a))
} else if (discriminant == 0 && a != 0) {
    print(-b / (2 * a))
} else {
    print("Error")
}

//2
let cathet1: Double = 5
let cathet2: Double = 10 //data
let hypotenuse = sqrt(cathet2 * cathet2 + cathet1 * cathet1)
let perimeter = cathet1 + cathet2 + hypotenuse
print("Square = \(0.5 * cathet1 * cathet2)")
print("Hypotenuse = \(hypotenuse)")
print("Perimeter = \(perimeter)")

//3
let summa: Double = 10000
let percent: Double = 5 //data
let increase = 1.0 + percent / 100
print(summa * pow(increase, 5))
