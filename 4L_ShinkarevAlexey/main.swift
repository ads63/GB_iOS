//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 24.07.2021.
//

import Foundation

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

let mers = SportCar(modelName: "Mersedes-Benz W128", year: 1959, windowsCount: 2, tankVolume: 40, trunkVolume: 10, fuelConsumption: 0.07, milage: 0)
mers?.print()
mers?.changeCarState(action: CarActions.openWindow(0))
mers?.changeCarState(action: CarActions.openWindow(1))
mers?.changeCarState(action: CarActions.openWindow(2))
mers?.changeCarState(action: CarActions.fillFuel(20))
mers?.changeCarState(action: CarActions.startEngine)
mers?.print()

let mersNew = SportCar(mers!)

mers?.changeCarState(action: CarActions.drive(10))
mers?.print()
mersNew.changeCarState(action: CarActions.load(5))
mersNew.changeCarState(action: CarActions.openWindow(0))
mersNew.print()
mersNew.changeCarState(action: CarActions.closeWindow(0))
mersNew.print()

var porsche = SportCar(modelName: "Porsche 911", year: 2021, windowsCount: 4, tankVolume: 40, trunkVolume: 60, fuelConsumption: 0.08, milage: 40000)!
porsche.print()
porsche.changeCarState(action: CarActions.fillFuel(30))
porsche.changeCarState(action: CarActions.startEngine)
porsche.changeCarState(action: CarActions.upRoof)
porsche.print()
porsche.changeCarState(action: CarActions.downRoof)
porsche.changeCarState(action: CarActions.drive(1000))
porsche.changeCarState(action: CarActions.hookTrailer)
porsche.print()

var man = TrunkCar(modelName: "MAN TGM", year: 2013, tankVolume: 40, bodyVolume: 51, fuelConsumption: 15, milage: 1000)!
man.print()
man.changeCarState(action: CarActions.openWindow(0))
man.changeCarState(action: CarActions.openWindow(5))
var man2 = TrunkCar(man)
man2.print()
man2.changeCarState(action: CarActions.load(2))
man2.print()
man2.changeCarState(action: CarActions.unload(0.5))
man2.changeCarState(action: CarActions.fillFuel(20))
man2.print()
man2.changeCarState(action: CarActions.fillFuel(30))
man2.print()
man2.changeCarState(action: CarActions.fillFuel(20))
man2.changeCarState(action: CarActions.startEngine)
man2.print()

var volvo = TrunkCar(modelName: "VOLVO FH", year: 2021, tankVolume: 80, bodyVolume: 60, fuelConsumption: 20, milage: 0)!
volvo.print()
volvo.changeCarState(action: CarActions.openWindow(0))
volvo.changeCarState(action: CarActions.load(70))
volvo.print()
volvo.changeCarState(action: CarActions.load(60))
volvo.changeCarState(action: CarActions.unload(70))
volvo.changeCarState(action: CarActions.unload(10))
volvo.changeCarState(action: CarActions.hookTrailer)
volvo.print()

var volvo2=TrunkCar(volvo)
volvo2.changeCarState(action: CarActions.fillFuel(10))
volvo.changeCarState(action: CarActions.unhookTrailer)
volvo2.print()
volvo.print()
