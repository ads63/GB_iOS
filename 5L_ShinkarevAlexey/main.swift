//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 29.07.2021.
//

import Foundation

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей,
// а также метод действия.
// 2. Создать расширения для протокола «Car» и реализовать в них методы
// конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить
// двигатель и т.д. (по одному методу на действие, реализовывать следует только
// те действия, реализация которых общая для всех автомобилей).
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar.
// Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
// 4. Для каждого класса написать расширение, имплементирующее протокол
// CustomStringConvertible.
// 5. Создать несколько объектов каждого класса. Применить к ним различные
// действия.
// 6. Вывести сами объекты в консоль.

let mers = SportCar(modelName: "Mersedes-Benz W128", year: 1959,
                    tankVolume: 40, trunkVolume: 10, fuelConsumption: 0.07,
                    milage: 0, windowsCount: 2)
print("\n\(mers!.description)")
mers?.changeCarState(action: CarActions.openWindow(0))
mers?.changeCarState(action: CarActions.openWindow(1))
mers?.changeCarState(action: CarActions.openWindow(2))
mers?.changeCarState(action: CarActions.fillFuel(20))
mers?.changeCarState(action: CarActions.startEngine)
print("\n\(mers!.description)")

let mersNew = SportCar(mers!)

mers?.changeCarState(action: CarActions.drive(10))
print("\n\(mers!.description)")
mersNew.changeCarState(action: CarActions.load(5))
mersNew.changeCarState(action: CarActions.openWindow(0))
print("\n\(mersNew.description)")
mersNew.changeCarState(action: CarActions.closeWindow(0))
print("\n\(mersNew.description)")

let porsche = SportCar(modelName: "Porsche 911", year: 2021, tankVolume: 40,
                       trunkVolume: 60, fuelConsumption: 0.08, milage: 40000,
                       windowsCount: 4)!

print("\n\(porsche.description)")
porsche.changeCarState(action: CarActions.fillFuel(30))
porsche.changeCarState(action: CarActions.startEngine)
porsche.changeCarState(action: CarActions.upRoof)
print("\n\(porsche.description)")
porsche.changeCarState(action: CarActions.downRoof)
porsche.changeCarState(action: CarActions.drive(1000))
porsche.changeCarState(action: CarActions.hookTrailer)
print("\n\(porsche.description)")

let man = TrunkCar(modelName: "MAN TGM", year: 2013, tankVolume: 40,
                   bodyVolume: 51, fuelConsumption: 15, milage: 1000)!
print("\n\(man.description)")
man.changeCarState(action: CarActions.openWindow(0))
man.changeCarState(action: CarActions.openWindow(5))
let man2 = TrunkCar(man)
print("\n\(man2.description)")
man2.changeCarState(action: CarActions.load(2))
print("\n\(man2.description)")
man2.changeCarState(action: CarActions.unload(0.5))
man2.changeCarState(action: CarActions.fillFuel(20))
print("\n\(man2.description)")
man2.changeCarState(action: CarActions.fillFuel(30))
print("\n\(man2.description)")
man2.changeCarState(action: CarActions.fillFuel(20))
man2.changeCarState(action: CarActions.startEngine)
print("\n\(man2.description)")

let volvo = TrunkCar(modelName: "VOLVO FH", year: 2021, tankVolume: 80,
                     bodyVolume: 60, fuelConsumption: 20, milage: 0)!
print("\n\(volvo.description)")
volvo.changeCarState(action: CarActions.openWindow(0))
volvo.changeCarState(action: CarActions.load(70))
print("\n\(volvo.description)")
volvo.changeCarState(action: CarActions.load(60))
volvo.changeCarState(action: CarActions.unload(70))
volvo.changeCarState(action: CarActions.unload(10))
volvo.changeCarState(action: CarActions.hookTrailer)
print("\n\(volvo.description)")

let volvo2 = TrunkCar(volvo)
volvo2.changeCarState(action: CarActions.fillFuel(10))
volvo.changeCarState(action: CarActions.unhookTrailer)
print("\n\(volvo2.description)")
print("\n\(volvo.description)")
