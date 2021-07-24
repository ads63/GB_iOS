//
//  Actions.swift
//  3L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 24.07.2021.
//
import Foundation

enum CarActions {
    case startEngine
    case stopEngine
    case openWindow(Int)
    case closeWindow(Int)
    case load(Double)
    case unload(Double)
    case fillFuel(Double)
    case drive(Double)
}

enum EngineState: String {
    case off = "остановлен"
    case on = "запущен"
}

enum WindowState: String {
    case closed = "закрыто"
    case opened = "открыто"
}
