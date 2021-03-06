//
//  Helpers.swift
//  InAccessibility-cwu
//
//  Created by Chris Wu on 5/23/22.
//

import Foundation
import SwiftUI

// learned how to do this from here:
// https://www.swiftbysundell.com/articles/formatting-numbers-in-swift/
func prettyPrice(_ rawData: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    //formatter.currencyCode = currency.rawValue
    formatter.maximumFractionDigits = 2
    
    let number = NSNumber(value: rawData)
    return formatter.string(from: number) ?? "Unknown"
}

func colorsToUse(modeToUse : ColorBlindMode) -> (greenColor : Color, redColor : Color) {
    switch modeToUse {
        case .greenRed:
            return (greenColor: .green, redColor: .red)
        case .greenPurple:
            return (greenColor: .green, redColor: .purple)
        case .blueOrange:
            return (greenColor: .blue, redColor: .orange)
        case .blueRed:
            return (greenColor: .blue, redColor: .red)
        case .blueBrown:
            return (greenColor: .blue, redColor: .brown)
        case .cyanBrown:
            return (greenColor: .cyan, redColor: .brown)
        case .yellowPink:
            return (greenColor: .yellow, redColor: .pink)
    }
}

func starColorToUse(desiredColor : StarColors) -> Color {
    switch desiredColor {
        case .yellowStar:
            return .yellow
        case .blueStar:
            return .blue
        case .cyanStar:
            return .cyan
        case .redStar:
            return .red
        case .purpleStar:
            return .purple
        case .orangeStar:
            return .orange
        case .brownStar:
            return .brown
        case .pinkStar:
            return .pink
    }
}
