import Foundation
import Glibc
 


func IsEven(_ a: Int) -> Bool {
    return (a % 2) == 0
}
print("IsEven(1):", IsEven(1))
print("IsEven(2)", IsEven(2))
print("IsEven(3)", IsEven(3))
print()



func IsDividedBy3(_ a: Int) -> Bool {
    return (a % 3) == 0
}
print("IsDividedBy3(3)", IsDividedBy3(3))
print("IsDividedBy3(4)", IsDividedBy3(4))
print("IsDividedBy3(5)", IsDividedBy3(5))
print()



var arr: [Int] = []
for i in 1...100 {
    arr.append(i)
}
print("Array of 100 elements:")
print("ArrCount:", arr.count)
print(arr)
print()



var i = 99
while i >= 0 {
    if ( IsEven(arr[i]) ||  IsDividedBy3(arr[i]) ) {
        arr.remove(at: i)
    }
    i -= 1
}
print("Array without %2 and %3:")
print("ArrCount:", arr.count)
print(arr)
print()



var arr_fib = [0, 1]
func AddFib(_ arr: inout Array<Int>) {
    let n: Int = arr[arr.count - 1] + arr[arr.count - 2]
    arr.append(n)
}
for _ in 1..<50 {
    AddFib(&arr_fib)
}
print("Array fibonacci:")
print("ArrCount:", arr_fib.count)
print(arr_fib)
print()


func GenerateEratos(_ n: Int64) -> Array<Int64> {
    var arr: [Int64] = []
    for i: Int64 in 2..<n {
        arr.append(i)
    }
    
    var i = 0
    while i < arr.count {
    
        let p:Int64 = arr[i]
        
        //Delete nmbers
        var j = i + 1
        while j < arr.count {
            if arr[j] % p == 0 {
                arr.remove(at:j)
            }
            else {
                j += 1
            }
        }
        
        i += 1
    }

    return arr
}

var arr_primary = GenerateEratos(546)
print("ArrEratos")
print("ArrCount:", arr_primary.count)
print(arr_primary)
print()
