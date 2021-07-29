//
//  Car.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 29.07.2021.
//

import Foundation

class Car {
    let model: String?
    let manufactured: Int?
    let tankVolume: Double?

    var engineState = EngineState.off
    var windowState: [WindowState]?
    var fuelVolume = 0.0
    var fuelConsumption: Double?
    var milage = 0.0 {
        didSet { fuelVolume -= (fuelConsumption! * (milage - oldValue)) }
    }

    init!(modelName: String, year: Int,
          tankVolume: Double,
          fuelConsumption: Double,
          milage: Double,
          windowsCount: Int) {
        if modelName.isEmpty ||
            year > Calendar.current.component(.year, from: Date()) ||
            year < 1900 ||
            ![2, 4].contains(windowsCount) ||
            tankVolume <= 0 ||
            fuelConsumption <= 0 ||
            milage < 0
        { return nil }

        self.manufactured = year
        self.model = modelName
        self.windowState = Array(repeating: WindowState.closed,
                                 count: windowsCount)
        self.tankVolume = tankVolume
        self.fuelConsumption = fuelConsumption
        self.milage = milage
    }
}

