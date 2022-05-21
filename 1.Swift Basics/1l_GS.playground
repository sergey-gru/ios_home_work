import Foundation
import Glibc


func SolveSquare(a: Double, b: Double, c: Double)
{
    print("Уравнение:\n", a, "x^2 + ", b, "x + ", c," = 0", separator:"")
    
    let d = b*b - 4*a*c
    print("Дискриминант:", d)
    
    var x1: Double = 0
    var x2: Double = 0
    
    if (d > 0)
    {
        x1 = ( -b + sqrt(d) ) / 2 / a
        x2 = ( -b - sqrt(d) ) / 2 / a
        print("x1:", x1, "x2:", x2)
    }
    else if (d == 0)
    {
        x1 = ( -b + sqrt(d) ) / 2 / a
        print("x:", x1)
    }
    else
    {
        print("Нет действительных корней")
    }
    
    
}



SolveSquare(a:2, b:4, c:1)
print()
SolveSquare(a:-9, b:6, c:-1)
print()
SolveSquare(a:2, b:-1, c:3.5)
print()
print()
print()


func TriangleInfo(a: Double, b: Double)
{
    print("Катеты прямоугольного треугольника:\na:", a, "b:", b)
    
    print("Площадь:", (a * b / 2) )
    let c = sqrt(a*a + b*b)
    print("Гипотенуза:", c)
    print("Ппериметр:", (a + b + c) )
    
}

TriangleInfo(a: 1, b: 2)
print()
TriangleInfo(a: 2, b: 3)
print()
TriangleInfo(a: 3, b: 4)
print()
print()
print()


func SolveDeposit(_ deposit: Float, _ percent: Float, _ years: Float)
{
    print("Депозит:", deposit)
    print("Процент:", percent * 100, "%")
    print("Годы:", years )
    
    let sum = deposit * pow((1 + percent), years)
    print("Сумма:", sum )
}

SolveDeposit(126_000, 0.30, 3)
print()
SolveDeposit(50_000, 0.07, 5)
print()
SolveDeposit(3_000_000, 0.12, 5)


