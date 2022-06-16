import Foundation
import Glibc

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
+2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
+3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
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
}

// "Error" is only for Swift 4. Use "ErrorType" for Swift 5
enum MyError: Error {
    case RuntimeError(String)
}

struct Car
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
    
    mutating func Action(_ act: CarAction) //throws
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
        }
    }
}

typealias SportCar = Car
typealias TrunkCar = Car


var c1 = TrunkCar("Niva", 2010)
print("This is Niva")
print(c1)

c1.Action(.TrunkLoad(kg:70))
print("Loading 70kg")
print(c1)

c1.Action(.DriveRun)
print("And go...")
print(c1)
print()



var c2 = SportCar("Mersedes", 2010)
print("This is Mersedes")
print(c2)


c2.Action(.DriveRun)
print("Start drive and run for enjoy")
print(c2)

print("My SportCar doesnt have a speed regulator and speed is maximum now")
print(c2)

print("So, salon_filled increases")
print("...")
c2.Action(.SalonLoad(kg:1))
print(c2)

print("...")
c2.Action(.SalonLoad(kg:1))
print(c2)

print("...")
c2.Action(.SalonLoad(kg:1))
print(c2)

c1.Action(.DriveStop)
c2.Action(.DriveStop)

