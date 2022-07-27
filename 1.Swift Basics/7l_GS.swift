/*
 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
 */

import Foundation

enum RuntimeError: Error
{
    case AddressWrong
    case LostLetter
}

class MyPost
{
    let arr: [String] = [
        "Address1",
        "Address2",
        "Address3"]

    func GetAdress(n: Int) -> String?
    {
        if n < self.arr.count {
            return self.arr[n]
        }
        return nil
    }



    func SendTo(_ to: Int) throws -> String
    {
        guard let adr = self.GetAdress(n: to) else {
            throw RuntimeError.AddressWrong
        }
        
        let r = Double.random(in: 0...1)
        if r > 0.8 {
            throw RuntimeError.LostLetter
        }
        
        return "Notification from \(adr)"
        
    }


}


let p = MyPost()

if let adr = p.GetAdress(n: 0) {
    print("Adress '\(adr)' exists")
}
else {
    print("Adress 0 not found")
}



guard let adr2 = p.GetAdress(n: 1) else {
    print("Adress 1 not found")
    
    throw RuntimeError.AddressWrong
}

print("Adress '\(adr2)' exists")


var res: String?
do {
    res = try p.SendTo(0)
    print("Letter 2 send. And answered '\(res!)'")
} catch {
    print("Letter 1 lost")
}

var res2 = try? p.SendTo(1)
if res2 != nil {
    print("Letter 2 send. And answered '\(res2!)'")
} else {
    print("Letter 2 lost")
}

