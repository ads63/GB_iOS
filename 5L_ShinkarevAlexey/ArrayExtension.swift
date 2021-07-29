//
//  ArrayExtension.swift
//  5L_ShinkarevAlexey
//
//  Created by Алексей Шинкарев on 29.07.2021.
//

extension Array {
    subscript(safe index: Index) -> Element? {
        get {
            return indices.contains(index) ? self[index] : nil
        }

        set(newValue) {
            if let newValue = newValue, indices.contains(index) {
                self[index] = newValue
            }
        }
    }
}
