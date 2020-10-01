//
//  Coffee.swift
//  SwiftUICoffee
//
//  Created by Abhiroop Patel on 01/10/20.
//

import Foundation

struct Coffee {
    let name: String
    let imageUrl: String
    let price: Double
}

extension Coffee {
    static func all() -> [Coffee] {
        return [
            Coffee(name: "Cappucinno", imageUrl: "Cappucinno", price: 2.5),
            Coffee(name: "Espresso", imageUrl: "Espresso", price: 2.0),
            Coffee(name: "Regular", imageUrl: "Regular", price: 1.0),
            Coffee(name: "Macchiato", imageUrl: "Macchiato", price: 3.0)
        ]
    }
}
