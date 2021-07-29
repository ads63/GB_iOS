//
//  TrunkCar.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 29.07.2021.
//
extension TrunkCar: CustomStringConvertible {
    var description: String {
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
}

import Foundation
class TrunkCar: Car, CarProtocol {
    private let bodyVolume: Double?
    private var filledVolume = 0.0
    private var trailerState = TrailerState.unhooked

    init!(modelName: String,
          year: Int,
          tankVolume: Double,
          bodyVolume: Double,
          fuelConsumption: Double,
          milage: Double,
          windowsCount: Int = 2) {
        if bodyVolume <= 0 { return nil }
        self.bodyVolume = bodyVolume
        super.init(modelName: modelName,
                   year: year,
                   tankVolume: tankVolume,
                   fuelConsumption: fuelConsumption,
                   milage: milage,
                   windowsCount: windowsCount)
    }

    convenience init(_ car: TrunkCar) {
        self.init(modelName: car.model!,
                  year: car.manufactured!,
                  tankVolume: car.tankVolume!,
                  bodyVolume: car.bodyVolume!,
                  fuelConsumption: car.fuelConsumption!,
                  milage: car.milage,
                  windowsCount: car.windowState!.count)
        windowState = car.windowState
        filledVolume = car.filledVolume
        fuelVolume = car.filledVolume
        engineState = car.engineState
        trailerState = car.trailerState
    }

    public func changeCarState(action: CarActions) {
        switch action {
        case .startEngine:
            engineState = startEngine()
        case .stopEngine:
            engineState = stopEngine()
        case .openWindow(let winIndex):
            windowState![safe: winIndex] = openWindow(winIndex)
        case .closeWindow(let winIndex):
            windowState![safe: winIndex] = closeWindow(winIndex)
        case .load(let volume):
            filledVolume = load(volume)
        case .unload(let volume):
            filledVolume = unload(volume)
        case .fillFuel(let volume):
            fuelVolume = fillFuel(volume)
        case .drive(let distance):
            milage = drive(distance)
        case .unhookTrailer:
            trailerState = unhookTrailer()
        case .hookTrailer:
            trailerState = hookTrailer()
        default:
            break
        }
    }

    private func hookTrailer() -> TrailerState {
        return TrailerState.hooked
    }

    private func unhookTrailer() -> TrailerState {
        return TrailerState.unhooked
    }

    private func load(_ volume: Double) -> Double {
        return (volume > 0 && volume <= (bodyVolume! - filledVolume)) ?
            filledVolume+volume : filledVolume
    }

    private func unload(_ volume: Double) -> Double {
        return (volume <= filledVolume) ? filledVolume - volume : 0
    }
}
