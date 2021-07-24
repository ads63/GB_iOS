//
//  TrunkCar.swift
//  3L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 24.07.2021.
//
// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

import Foundation

struct TrunkCar {
    private let model: String?
    private let manufactured: Int?
    private let bodyVolume: Double?
    private let tankVolume: Double?

    private var engineState = EngineState.off
    private var windowState: [WindowState] = [WindowState.closed, WindowState.closed]
    private var filledVolume = 0.0
    private var fuelVolume = 0.0
    private var fuelConsumption: Double?
    private var milage = 0.0 {
        didSet { fuelVolume -= (fuelConsumption! * (milage-oldValue)) }
    }


    init!(modelName: String, year: Int, tankVolume: Double, bodyVolume: Double, fuelConsumption: Double, milage: Double)
    {
        if isInvalid(modelName, year, tankVolume, bodyVolume, fuelConsumption, milage) { return nil }

        self.manufactured = year
        self.model = modelName
        self.bodyVolume = bodyVolume
        self.tankVolume = tankVolume
        self.fuelConsumption = fuelConsumption
        self.milage = milage

        func isInvalid(_ modelName: String, _ year: Int, _ tankVolume: Double, _ trunkVolume: Double, _ fuelConsumption: Double, _ milage: Double) -> Bool {
            return modelName.isEmpty || // пустое название модели
                year>Calendar.current.component(.year, from: Date()) || // год выпуска в будущем
                year < 1900 || // год выпуска до 1900
                tankVolume <= 0 || // объем бака отрицательный
                trunkVolume <= 0 || // объем багажника
                fuelConsumption <= 0 || // расход топлива
                milage<0 // пробег
        }
    }

    public mutating func changeCarState(action: CarActions) {
        var result = true
        switch action {
        case .startEngine:
            result=startEngine()
        case .stopEngine:
            result=stopEngine()
        case .openWindow(let winIndex):
            result=openWindow(winIndex)
        case .closeWindow(let winIndex):
            result=closeWindow(winIndex)
        case .load(let volume):
            result=load(volume)
        case .unload(let volume):
            result=unload(volume)
        case .fillFuel(let volume):
            result=fillFuel(volume)
        case .drive(let distance):
            result=drive(distance)
        }
        if !result { Swift.print("\(model!): Действие \(action) не выполнено\n") }
    }

    public func print() {
        var result = [
            "Модель: \(model!)",
            "Год изготовления: \(manufactured!)",
            "Двигатель: \(engineState.rawValue)",
            "Объем  кузова: \(bodyVolume!) куб.м",
            "Объем груза: \(filledVolume) куб.м",
            "Объем бака: \(tankVolume!) л",
            "Объем топлива: \(fuelVolume) л",
            "Расход топлива: \(fuelConsumption!) л/км",
            "Пробег: \(milage) км"
        ]

        for (index, element) in windowState.enumerated() { result.insert("Окно \(index+1): \(element.rawValue)", at: index+2) }

        Swift.print(result.joined(separator: "\n")+"\n")
    }
    
    private mutating func startEngine() -> Bool {
        if fuelVolume>0 { engineState = EngineState.on }
        return engineState==EngineState.on
    }

    private mutating func stopEngine() -> Bool {
        engineState = EngineState.off
        return engineState==EngineState.off
    }

    private mutating func openWindow(_ winIndex: Int) -> Bool {
        var result = false
        if (0 ... windowState.count-1) ~= winIndex {
            windowState[winIndex] = WindowState.opened
            result = true
        }
        return result
    }

    private mutating func closeWindow(_ winIndex: Int) -> Bool {
        var result = false
        if (0 ... windowState.count-1) ~= winIndex {
            windowState[winIndex] = WindowState.closed
            result = true
        }
        return result
    }

    private mutating func load(_ volume: Double) -> Bool {
        var result = false
        if volume>0 && volume <= (bodyVolume!-filledVolume) {
            filledVolume += volume
            result = true
        }
        return result
    }

    private mutating func unload(_ volume: Double) -> Bool {
        var result = false
        if volume <= filledVolume {
            filledVolume -= volume
            result = true
        }
        return result
    }

    private mutating func fillFuel(_ volume: Double) -> Bool {
        var result = false
        if volume>0 && volume <= (tankVolume!-fuelVolume) {
            fuelVolume += volume
            result = true
        }
        return result
    }

    private mutating func drive(_ distance: Double) -> Bool {
        var result = false
        if engineState==EngineState.on && fuelVolume>0 && distance>0 {
            milage += min(distance, fuelVolume / fuelConsumption!)
            result = true
        }
        return result
    }
}
