//
//  Car.swift
//  GB_homeworks
//
//  Created by Алексей Шинкарев on 25.07.2021.
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
        didSet { fuelVolume -= (fuelConsumption! * (milage-oldValue)) }
    }

    init!(modelName: String, year: Int, tankVolume: Double,
          fuelConsumption: Double, milage: Double, windowsCount: Int)
    {
        if modelName.isEmpty ||
            year>Calendar.current.component(.year, from: Date()) ||
            year < 1900 ||
            ![2, 4].contains(windowsCount) ||
            tankVolume <= 0 ||
            fuelConsumption <= 0 ||
            milage < 0
        { return nil }

        self.manufactured = year
        self.model = modelName
        self.windowState = Array(repeating: WindowState.closed, count: windowsCount)
        self.tankVolume = tankVolume
        self.fuelConsumption = fuelConsumption
        self.milage = milage
    }

    public func changeCarState(action: CarActions) {}

    func startEngine() -> Bool {
        if fuelVolume>0 { engineState = EngineState.on }
        return engineState==EngineState.on
    }

    func stopEngine() -> Bool {
        engineState = EngineState.off
        return engineState==EngineState.off
    }

    func openWindow(_ winIndex: Int) -> Bool {
        var result = false
        if (0 ... windowState!.count-1) ~= winIndex {
            windowState![winIndex] = WindowState.opened
            result = true
        }
        return result
    }

    func closeWindow(_ winIndex: Int) -> Bool {
        var result = false
        if (0 ... windowState!.count-1) ~= winIndex {
            windowState![winIndex] = WindowState.closed
            result = true
        }
        return result
    }

    func fillFuel(_ volume: Double) -> Bool {
        var result = false
        if volume>0, volume <= (tankVolume!-fuelVolume) {
            fuelVolume += volume
            result = true
        }
        return result
    }

    func drive(_ distance: Double) -> Bool {
        var result = false
        if engineState==EngineState.on, fuelVolume>0, distance>0 {
            milage += min(distance, fuelVolume / fuelConsumption!)
            result = true
        }
        return result
    }
}
