//
//  main.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 24.07.2021.
//

import Foundation

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.

var suzuki = SportCar(modelName: "suzuki jimny", year: 1988, windowsCount: 2, tankVolume: 40, trunkVolume: 10, fuelConsumption: 0.07, milage: 0)!
suzuki.print()
suzuki.changeCarState(action: CarActions.openWindow(0))
suzuki.changeCarState(action: CarActions.openWindow(1))
suzuki.changeCarState(action: CarActions.openWindow(2))
suzuki.changeCarState(action: CarActions.fillFuel(20))
suzuki.changeCarState(action: CarActions.startEngine)
suzuki.print()

var suzukiNew = suzuki

suzuki.changeCarState(action: CarActions.drive(10))
suzuki.print()
suzukiNew.changeCarState(action: CarActions.load(5))
suzukiNew.changeCarState(action: CarActions.openWindow(0))
suzukiNew.print()
suzukiNew.changeCarState(action: CarActions.closeWindow(0))
suzukiNew.print()

var kia = SportCar(modelName: "kia soul", year: 2019, windowsCount: 4, tankVolume: 40, trunkVolume: 60, fuelConsumption: 0.08, milage: 40000)!
kia.print()
kia.changeCarState(action: CarActions.fillFuel(30))
kia.changeCarState(action: CarActions.startEngine)
kia.print()
kia.changeCarState(action: CarActions.drive(1000))
kia.print()

var man = TrunkCar(modelName: "MAN TGM", year: 2013, tankVolume: 40, bodyVolume: 51, fuelConsumption: 15, milage: 1000)!
man.print()
man.changeCarState(action: CarActions.openWindow(0))
man.changeCarState(action: CarActions.openWindow(5))
var man2 = TrunkCar(car: man)
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
volvo.print()

var volvo2=volvo
volvo2.changeCarState(action: CarActions.fillFuel(10))
volvo2.print()
volvo.print()
