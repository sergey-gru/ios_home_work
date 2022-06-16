import Foundation
import Glibc

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/


enum CarAction
{
    case DriveRun
    case DriveStop
    case OpenWindows
    case CloseWindows
    case Load
    case Unload
    
}


struct SportCar
{
    var model: String
    var build_year: Int
    
    var trunk_filled: Double = 0
    var trunk_volume: Double = 100
    var salon_filled: Double = 0
    var salon_volume: Double = 100
    var windows_openned = false
    var engine_run = false
    
    init(_ model: String, _ year: Int)
    {
        self.model = model
        self.build_year = year
    }
    
    mutating func Action(_ act: CarAction)
    {
        /*switch act
        {
            case .DriveRun
        }*/
    }
}


var c1 = SportCar("Lada", 2010)




struct TrunkCar
{
    
}
