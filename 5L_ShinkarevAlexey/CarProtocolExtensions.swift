//
//  CarProtocolExtensions.swift
//  5L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 29.07.2021.
//
// 2. Создать расширения для протокола «Car» и реализовать в них методы
// конкретных действий с автомобилем: открыть/закрыть окно,
// запустить/заглушить двигатель и т.д.
// (по одному методу на действие, реализовывать следует только те действия,
// реализация которых общая для всех автомобилей).

import Foundation

extension CarProtocol {
    func changeCarState(action: CarActions) {}
    func startEngine() -> EngineState {
        return fuelVolume>0 ? EngineState.on : engineState
    }

    func stopEngine() -> EngineState {
        return EngineState.off
    }
}

extension CarProtocol {
    func openWindow(_ winIndex: Int) -> WindowState? {
        return (0 ... windowState!.count-1) ~= winIndex ?
            WindowState.opened : nil
    }

    func closeWindow(_ winIndex: Int) -> WindowState? {
        return (0 ... windowState!.count-1) ~= winIndex ?
            WindowState.closed : nil
    }
}

extension CarProtocol {
    func fillFuel(_ volume: Double) -> Double {
        return (volume>0 && volume <= (tankVolume!-fuelVolume)) ?
            fuelVolume + volume : fuelVolume
    }

    func drive(_ distance: Double) -> Double {
        return engineState == EngineState.on && fuelVolume>0 && distance>0 ?
            milage + min(distance, fuelVolume / fuelConsumption!) : milage
    }
}
