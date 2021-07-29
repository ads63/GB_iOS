//
//  CarProtocol.swift
//  5L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 29.07.2021.
//
// 1. Создать протокол «Car» и описать свойства, общие для автомобилей,
// а также метод действия.

import Foundation

protocol CarProtocol: AnyObject {
    var model: String? { get }
    var manufactured: Int? { get }
    var tankVolume: Double? { get }

    var engineState: EngineState { get set }
    var windowState: [WindowState]? { get set }
    var fuelVolume: Double { get set }
    var fuelConsumption: Double? { get set }
    var milage: Double { get set }

    func changeCarState(action: CarActions)
    func startEngine() -> EngineState
    func stopEngine() -> EngineState
    func openWindow(_ winIndex: Int) -> WindowState?
    func closeWindow(_ winIndex: Int) -> WindowState?
    func fillFuel(_ volume: Double) -> Double
    func drive(_ distance: Double) -> Double
}

