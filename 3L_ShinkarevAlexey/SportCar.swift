//
//  SportCar.swift
//  3L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 21.07.2021.
//

import Foundation
struct Car {
    var fuelVolume : Decimal?
    let model: String?
    let yearOfManufacture: Int?
    let trunkVolume: Decimal?
    var engineState: Bool?
    var windowState : [Bool]?
    var filledVolume: Decimal?
}
extension SportCar : Car {
    <#fields#>
}
