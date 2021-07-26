//
//  Actions.swift
//  3L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 25.07.2021.
//
// import Foundation

enum CarActions {
    case startEngine
    case stopEngine
    case openWindow(Int)
    case closeWindow(Int)
    case load(Double)
    case unload(Double)
    case fillFuel(Double)
    case drive(Double)
    case upRoof
    case downRoof
    case hookTrailer
    case unhookTrailer
}

enum RoofState: String {
    case up = "поднята"
    case down = "опущена"
}

enum TrailerState: String {
    case hooked = "прицеплен"
    case unhooked = "отцеплен"
}

enum EngineState: String {
    case off = "остановлен"
    case on = "запущен"
}

enum WindowState: String {
    case closed = "закрыто"
    case opened = "открыто"
}
