import Foundation
import Glibc

/*
Урок 5. ООП: требование к классам, протоколы, расширения, полиморфизм, композиция
+1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

+2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

+3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

+4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

+5. Создать несколько объектов каждого класса. Применить к ним различные действия.
+6. Вывести сами объекты в консоль.
*/

protocol Car : AnyObject
{
    init(_ model: String, _ year: Int)
    
    var model: String { get set }
    var year: Int { get set }
    
    var trunk: Double { get set }
    var trunk_max: Double { get set }
    var salon: Double { get set }
    var salon_max: Double { get set }
    var windows: Bool { get set }
    var drive: Bool { get set }

}

extension Car
{

    func Run()
    {
        self.drive = true
    }
    func Stop()
    {
        self.drive = false
    }
    func OpenWindows()
    {
        self.windows = true
    }
    func CloseWindows()
    {
        self.windows = false
    }
    
    func LoadSalon(kg: Double)
    {
        self.salon += kg
        if self.salon > self.salon_max {
            self.salon = self.salon_max
        }
    }
    
    func UnLoadSalon(kg: Double)
    {
        self.salon -= kg
        if self.salon < 0 {
            self.salon = 0
        }
    }
    
    func LoadTrunk(kg: Double)
    {
        self.trunk += kg
        if self.trunk > self.trunk_max {
            self.trunk = self.trunk_max
        }
    }
    
    func UnLoadTrunk(kg: Double)
    {
        self.trunk -= kg
        if self.trunk < 0 {
            self.trunk = 0
        }
    }
    
}


class TrunkCar : Car
{
    var model: String
    var year: Int
    
    var trunk: Double = 0
    var trunk_max: Double = 100
    var salon: Double = 0
    var salon_max: Double = 100
    var windows = false
    var drive = false
    
    var tank: Double = 0
    var tank_max: Double = 40_000
    
    required init(_ model: String, _ year: Int)    
    {
        self.model = model
        self.year = year
    }
    
    func LoadTank(kg: Double)
    {
        self.tank += kg
        if self.tank > self.tank_max
        {
            self.tank = self.tank_max
        }
    }
    func UnloadTank(kg: Double)
    {
        self.tank -= kg
        if self.tank < 0
        {
            self.tank = 0
        }
    }
    
}

extension TrunkCar : CustomStringConvertible
{
    var description: String
    {
        """
        Car \(self.model) since \(self.year)
        Salon: \(self.salon) of \(self.salon_max)
        Trunk: \(self.trunk) of \(self.trunk_max)
        Windows: \(self.windows)
        Drive: \(self.drive)
        TrunkBody: \(self.tank) of \(self.tank_max)
        
        """
    }
}

class SportCar : Car
{
    var model: String
    var year: Int
    
    var trunk: Double = 0
    var trunk_max: Double = 100
    var salon: Double = 0
    var salon_max: Double = 100
    var windows = false
    var drive = false
    
    var nitro: Bool = false
    
    required init(_ model: String, _ year: Int)    
    {
        self.model = model
        self.year = year
    }
    
    func RunForce()
    {
        self.drive = true
        self.nitro = true
    }
    
    func Stop()
    {
        self.drive = false
        self.nitro = false
    }
    
}

extension SportCar : CustomStringConvertible
{
    var description: String
    {
        """
        Car \(self.model) since \(self.year)
        Salon: \(self.salon) of \(self.salon_max)
        Trunk: \(self.trunk) of \(self.trunk_max)
        Windows: \(self.windows)
        Drive: \(self.drive)
        Nitro: \(self.nitro)
        
        """
    }
}





var c1 = TrunkCar("Niva", 2010)
c1.LoadTank(kg:100)
c1.OpenWindows()
c1.LoadTank(kg:1_000)
c1.Run()
print(c1)


var c2 = SportCar("Mersedes", 2016)
c2.LoadSalon(kg:70)
c2.RunForce()
print(c2)


