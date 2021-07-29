//
//  SportCar.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 29.07.2021.
//

import Foundation

extension SportCar: CustomStringConvertible {
    var description: String {
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
}

class SportCar: Car, CarProtocol {
    private let trunkVolume: Double?
    private var filledVolume = 0.0
    private var roofState = RoofState.up

    init!(modelName: String,
          year: Int,
          tankVolume: Double,
          trunkVolume: Double,
          fuelConsumption: Double,
          milage: Double,
          windowsCount: Int) {
        if trunkVolume <= 0 { return nil }
        self.trunkVolume = trunkVolume

        super.init(modelName: modelName, year: year, tankVolume: tankVolume,
                   fuelConsumption: fuelConsumption, milage: milage,
                   windowsCount: windowsCount)
    }

    convenience init(_ car: SportCar) {
        self.init(modelName: car.model!,
                  year: car.manufactured!,
                  tankVolume: car.tankVolume!,
                  trunkVolume: car.trunkVolume!,
                  fuelConsumption: car.fuelConsumption!,
                  milage: car.milage,
                  windowsCount: car.windowState!.count)
        windowState = car.windowState
        filledVolume = car.filledVolume
        fuelVolume = car.filledVolume
        engineState = car.engineState
        roofState = car.roofState
    }

    public func changeCarState(action: CarActions) {
        switch action {
        case .startEngine:
            engineState = startEngine()
        case .stopEngine:
            engineState = stopEngine()
        case .openWindow(let winIndex):
            windowState![safe: winIndex] =
                openWindow(winIndex) ?? windowState![safe: winIndex]
        case .closeWindow(let winIndex):
            windowState![safe: winIndex] =
                closeWindow(winIndex) ?? windowState![safe: winIndex]
        case .load(let volume):
            filledVolume = load(volume)
        case .unload(let volume):
            filledVolume = unload(volume)
        case .fillFuel(let volume):
            fuelVolume = fillFuel(volume)
        case .drive(let distance):
            milage = drive(distance)
        case .upRoof:
            roofState = upRoof()
        case .downRoof:
            roofState = downRoof()
        default:
            break
        }
    }

    private func load(_ volume: Double) -> Double {
        return volume > 0 && volume <= (trunkVolume! - filledVolume) ?
            filledVolume + volume : filledVolume
    }

    private func upRoof() -> RoofState {
        return RoofState.up
    }

    private func downRoof() -> RoofState {
        return RoofState.down
    }

    private func unload(_ volume: Double) -> Double {
        return volume <= filledVolume ? filledVolume - volume : 0
    }
}
