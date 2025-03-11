//
//  NumericExtension.swift
//  Adding Game
//
//  Created by mehmet Çelik on 11.03.2025.
//

import Foundation


let ordinalFormatter: NumberFormatter = {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .ordinal
    
    return numberFormatter
}()

extension Numeric {
    var ordinal: String {
        return ordinalFormatter
            .string(for: self) ?? String(describing: self)
    }
}
