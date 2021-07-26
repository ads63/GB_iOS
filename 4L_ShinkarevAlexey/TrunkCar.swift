//
//  TrunkCar.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 25.07.2021.
//

import Foundation
/// TrunkCar class
class TrunkCar: Car {
    private let bodyVolume: Double?
    /// объем кузова
    private var filledVolume = 0.0
    /// состояние прицепа
    private var trailerState = TrailerState.unhooked

    init!(modelName: String, year: Int, windowsCount: Int = 2, tankVolume: Double,
          bodyVolume: Double, fuelConsumption: Double, milage: Double)
    {
        if bodyVolume <= 0 { return nil }
        self.bodyVolume = bodyVolume
        super.init(modelName: modelName, year: year,
                   tankVolume: tankVolume, fuelConsumption: fuelConsumption,
                   milage: milage, windowsCount: windowsCount)
    }

    convenience init(_ car: TrunkCar) {
        self.init(modelName: car.model!, year: car.manufactured!,
                  windowsCount: car.windowState!.count,
                  tankVolume: car.tankVolume!, bodyVolume: car.bodyVolume!,
                  fuelConsumption: car.fuelConsumption!, milage: car.milage)
        windowState = car.windowState
        filledVolume = car.filledVolume
        fuelVolume = car.filledVolume
        engineState = car.engineState
        trailerState = car.trailerState
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
        case .unhookTrailer:
            result = unhookTrailer()
        case .hookTrailer:
            result = hookTrailer()
        default:
            break
        }
        if !result {
            Swift.print("\(model!): Действие \(action) не выполнено\n")
            
        }
    }

    /// печать метода
    public func print() {
        Swift.print(toString()+"\n")
    }

    /// трансформация в строку
    public func toString() -> String {
        var result = [
            "Модель: \(model!)",
            "Год изготовления: \(manufactured!)",
            "Двигатель: \(engineState.rawValue)",
            "Объем бака: \(tankVolume!) л",
            "Объем топлива: \(fuelVolume) л",
            "Расход топлива: \(fuelConsumption!) л/км",
            "Пробег: \(milage) км",
            "Объем кузова: \(bodyVolume!) куб.м",
            "Объем груза: \(filledVolume) куб.м",
            "Прицеп: \(trailerState.rawValue)"
        ]

        for (index, element) in windowState!.enumerated() {
            result.insert("Окно \(index+1): \(element.rawValue)", at: index+2)
        }

        return result.joined(separator: "\n")
    }

    private func hookTrailer() -> Bool {
        trailerState = TrailerState.hooked
        return trailerState == TrailerState.hooked
    }

    private func unhookTrailer() -> Bool {
        trailerState = TrailerState.unhooked
        return trailerState == TrailerState.unhooked
    }

    private func load(_ volume: Double) -> Bool {
        var result = false
        if volume > 0, volume <= (bodyVolume! - filledVolume) {
            filledVolume += volume
            result = true
        }
        return result
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
