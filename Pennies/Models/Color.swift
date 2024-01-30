//
//  Color.swift
//  Pennies
//
//  Created by J. DeWeese on 1/29/24.
//

import SwiftUI


/// Custom Tint Colors For Transaction Row
struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor] = [
    .init(color: "Red", value: .colorRed),
    .init(color: "Blue", value: .colorBlue),
    .init(color: "Pink", value: .pink),
    .init(color: "Purple", value: .colorPurple),
    .init(color: "Brown", value: .brown),
    .init(color: "Orange", value: .colorOrange),
    .init(color: "Green", value: .colorGreen),
    .init(color: "Gray", value: .colorGray),
    .init(color: "Yellow", value: .colorYellow),
    .init(color: "Titanium", value: .colorTitanium),
    .init(color: "Background", value: .colorBackground)
]
var appTint: Color {
    return Constants.shared.tintColor
}
