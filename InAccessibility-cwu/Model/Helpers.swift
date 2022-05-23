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
    #warning("update readme")
    
    switch modeToUse {
        case .greenRed:
            return (greenColor: .green, redColor: .red)
        case .blueOrange:
            return (greenColor: .blue, redColor: .orange)
        case .blueRed:
            return (greenColor: .blue, redColor: .red)
        case .blueBrown:
            return (greenColor: .blue, redColor: .brown)
    }
}
