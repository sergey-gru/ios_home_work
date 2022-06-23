import Foundation
import Glibc

/*
Урок 4. Введение в ООП — объектно-ориентированное программирование
+1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
+2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
+3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

+4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
+5. Создать несколько объектов каждого класса. Применить к ним различные действия.
+6. Вывести значения свойств экземпляров в консоль.
*/


enum CarAction
{
	case DriveRun
	case DriveStop
	case WindowsOpen
	case WindowsClose
	case TrunkLoad(kg: Double)
	case TrunkUnLoad(kg: Double)
	case SalonLoad(kg: Double)
	case SalonUnLoad(kg: Double)
	
	case TrunkLoadBody(kg: Double)
	case TrunkUnLoadBody(kg: Double)
	
	case DriveRunForce
	case DriveStopForce
}

// "Error" is only for Swift 4. Use "ErrorType" for Swift 5
enum MyError: Error {
    case RuntimeError(String)
}

class Car : CustomStringConvertible
{
    var model: String
    var build_year: Int
    
    var trunk_filled: Double = 0
    var trunk_volume: Double = 100
    var salon_filled: Double = 0
    var salon_volume: Double = 100
    var windows_openned = false
    var drive_run = false
    
    init(_ model: String, _ year: Int)
    {
        self.model = model
        self.build_year = year
    }
    
    func Action(_ act: CarAction) //throws
    {
        switch act {
            case .DriveRun:
				self.drive_run = true
            case .DriveStop:
				self.drive_run = false
            case .WindowsOpen:
				self.windows_openned = true
            case .WindowsClose:
				self.windows_openned = false
			
            case let .TrunkLoad(kg):
				let a = self.trunk_filled + kg
				if a > self.trunk_volume {
    				//throw MyError.RuntimeError("Overflow")
				}
				self.trunk_filled = a
				
            case let .TrunkUnLoad(kg):
                let a = self.trunk_filled - kg
				if a < 0 {
					//throw MyError.RuntimeError("Volume is empty")
				}
				self.trunk_filled = a
				
            case let .SalonLoad(kg):
                let a = self.salon_filled + kg
				if a > self.salon_volume {
					//throw MyError.RuntimeError("Overflow")
				}
				self.salon_filled = a
				
            case let .SalonUnLoad(kg):
                let a = self.salon_filled - kg
				if a < 0 {
					//throw MyError.RuntimeError("Volume is empty")
				}
				self.salon_filled = a
			
			default:
			    break
        }
    }
    
    var description: String
    {
        """
        Car \(self.model) since \(self.build_year)
        Salon: \(self.salon_filled) of \(self.salon_volume)
        Trunk: \(self.trunk_filled) of \(self.trunk_volume)
        Windows: \(self.windows_openned)
        Drive: \(self.drive_run)
        
        """
    }
}

class TrunkCar : Car
{
    var trunk_body: Double = 0
    var trunk_body_volume: Double = 40_000
    
    override func Action(_ act: CarAction)
    {
        switch act
        {
            case let .TrunkLoadBody(kg):
                let a = self.trunk_body + kg
                if a > self.trunk_body_volume {
                    //throw MyError.RuntimeError("Overflow")
                }
                self.trunk_body = a
                
            case let .TrunkUnLoadBody(kg):
                let a = self.trunk_filled - kg
                if a < 0 {
                    //throw MyError.RuntimeError("Volume is empty")
                }
                self.trunk_body = a
            
            default:
                super.Action(act)
		}
    }
    
    override
    var description: String
    {
        super.description +
        """
        TrunkBody: \(self.trunk_body) of \(self.trunk_body_volume)
        
        """
    }
    
}

class SportCar : Car
{
    var nitro: Bool = false
    
    override func Action(_ act: CarAction)
    {
        switch act
        {
            case .DriveRunForce:
				self.nitro = true
				self.drive_run = true
				
            case .DriveStopForce:
				self.nitro = false
                self.drive_run = false
            
            default:
                super.Action(act)
		}
    }
    
    override
    var description: String
    {
        super.description +
        """
        Nitro: \(self.nitro)
        
        """
    }
    
}





var c1 = TrunkCar("Niva", 2010)
c1.Action(.TrunkLoadBody(kg:1_000))
print(c1)


var c2 = SportCar("Mersedes", 2016)
c2.Action(.DriveRunForce)
print(c2)


