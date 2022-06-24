import Foundation
import Glibc

/*
Урок 6. Продвинутое ООП
+1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
+2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
+3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
*/


class Queue<T> : CustomStringConvertible
{
	private var arr = [T]()
    
    init() {}
	init(_ arr: Array<T>)
	{
	    self.arr = arr
	}
	
	subscript (_ index: Int) -> T?
	{
	    if index < 0 || index > arr.count { return nil }
		return self.arr[index]
		
	}
	
	func Filter(_ fn: (_ it: T) -> Bool ) -> Array<T>
	{
	    var arr = [T]()
	    
	    for it in self.arr
	    {
	        if fn(it)
	        {
	            arr.append(it)
	        }
	    }
	    
	    return arr
	}
	
	func Clear()
	{
	    self.arr.removeAll()
	}
	
	func Push(_ a: T)
	{
	    self.arr.append(a)
	}
	
	func Pop() -> T?
	{
	    if self.arr.count == 0 { return nil } 
	    return arr.removeLast()
	}
	
	func Shift(_ a: T)
	{
	    self.arr.insert(a, at: self.arr.count)
	}
	
	@discardableResult
	func Unshift() -> T?
	{
	    if self.arr.count == 0 { return nil }
	    return arr.removeFirst()
	}
	
	var description: String { self.arr.description }
}

var q = Queue<Int>([1,2,3])
print(q)
q.Clear()
print("Clear:", q)
print()

q = Queue<Int>([1,2,3])
print(q)
var arr = q.Filter( { $0 > 2 } )
print("Filter:", arr)
print()

q.Push(1)
print(q)
q.Push(2)
print(q)
q.Push(3)
print(q)

print("Pop:", q.Pop() ?? "nil")
print(q)
print("Pop:", q.Pop() ?? "nil")
print(q)
print("Pop:", q.Pop() ?? "nil")
print(q)

print("Pop:", q.Pop() ?? "nil")
print()

q.Shift(1)
print(q)
q.Shift(2)
print(q)
q.Shift(3)
print(q)

print("Unshift:", q.Unshift() ?? "nil")
print(q)
print("Unshift:", q.Unshift() ?? "nil")
print(q)
print("Unshift:", q.Unshift() ?? "nil")
print(q)

print("Unshift:", q.Unshift() ?? "nil")
print()

print("Item[8]:", q[8] ?? "nil")


