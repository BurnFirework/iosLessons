//№1

import Darwin
func pariry(_ x: Int) -> Bool {
    return x % 2 == 0
}

//№2
func multiplicityOfThree(_ x: Int) -> Bool {
    return x % 3 == 0
}

//№3
var array = [Int]()
for i in 1...100 {
    array.append(i * 5)
}

//№4

var i = 0
while(i < array.count) {
    if pariry(array[i]) || !multiplicityOfThree(array[i]) {
        array.remove(at: i)
    }
    else {
        i += 1
    }
}

//№5
func fibonacci() {
    var a = 0
    var b = 1
    var tmp = 0
    for _ in 1...48 {
        array.append(a + b)
        tmp = a
        a = b
        b = tmp + a
    }
}

//№6
let n = 100
var isPrime = [Bool]()

for _ in 0...n {
    isPrime.append(true)
}

var p = 2
while (p < n + 1) {
    for i in stride(from: p+p, through: n, by: p) {
        isPrime[i] = false
    }
    p = p + 1
    while (p < n + 1 && !isPrime[p]) {
        p += 1
    }
}

for i in 2...n {
    if isPrime[i] {
        print(i)
    }
}
