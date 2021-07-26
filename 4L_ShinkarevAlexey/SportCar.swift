//
//  SportCar.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 25.07.2021.
//

import Foundation

class SportCar: Car {
    private let trunkVolume: Double?
    private var filledVolume = 0.0
    private var roofState = RoofState.up


    init!(modelName: String, year: Int, tankVolume: Double, trunkVolume: Double,
          fuelConsumption: Double, milage: Double, windowsCount: Int) {
        if trunkVolume <= 0 { return nil }
        self.trunkVolume = trunkVolume

        super.init(modelName: modelName, year: year, tankVolume: tankVolume,
                   fuelConsumption: fuelConsumption, milage: milage,
                   windowsCount: windowsCount)
    }
    
    convenience init(_ car: SportCar) {
        self.init(modelName: car.model!, year: car.manufactured!,
                  tankVolume: car.tankVolume!, trunkVolume: car.trunkVolume!,
                  fuelConsumption: car.fuelConsumption!, milage: car.milage,
                  windowsCount: car.windowState!.count)
        windowState = car.windowState
        filledVolume = car.filledVolume
        fuelVolume = car.filledVolume
        engineState = car.engineState
        roofState = car.roofState
    }

    override public func changeCarState(action: CarActions) {
        var result = true
        switch action {
        case .startEngine:
            result = startEngine()
        case .stopEngine:
            result = stopEngine()
        case .openWindow(let winIndex):
            result = openWindow(winIndex)
        case .closeWindow(let winIndex):
            result = closeWindow(winIndex)
        case .load(let volume):
            result = load(volume)
        case .unload(let volume):
            result = unload(volume)
        case .fillFuel(let volume):
            result = fillFuel(volume)
        case .drive(let distance):
            result = drive(distance)
        case .upRoof:
            result = upRoof()
        case .downRoof:
            result = downRoof()
        default:
            break
        }
        if !result { Swift.print("\(model!): Действие \(action) не выполнено\n") }
    }

    public func print() {
        Swift.print(toString() + "\n")
    }

    public func toString() -> String {
        var result = [
            "Модель: \(model!)",
            "Год изготовления: \(manufactured!)",
            "Двигатель: \(engineState.rawValue)",
            "Объем бака: \(tankVolume!) л",
            "Объем топлива: \(fuelVolume) л",
            "Расход топлива: \(fuelConsumption!) л/км",
            "Пробег: \(milage) км",
            "Объем багажника: \(trunkVolume!) л",
            "Объем багажа: \(filledVolume) л",
            "Положение крыши: \(roofState.rawValue)"
        ]

        for (index, element) in windowState!.enumerated() {
            result.insert("Окно \(index + 1): \(element.rawValue)", at: index + 2)
        }
        return result.joined(separator: "\n")
    }

    private func load(_ volume: Double) -> Bool {
        var result = false
        if volume > 0, volume <= (trunkVolume! - filledVolume) {
            filledVolume += volume
            result = true
        }
        return result
    }

    private func upRoof() -> Bool {
        roofState = RoofState.up
        return roofState==RoofState.up
    }

    private func downRoof() -> Bool {
        roofState = RoofState.down
        return roofState==RoofState.down
    }

    private func unload(_ volume: Double) -> Bool {
        var result = false
        if volume <= filledVolume {
            filledVolume -= volume
            result = true
        }
        return result
    }
}
