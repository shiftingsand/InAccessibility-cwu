//
//  StockConstants.swift
//  InAccessibility
//
//  Created by Chris Wu on 5/21/22.
//

import Foundation
import SwiftUI

enum UIConstants {
    static let SmallGraphicsSize : Font = .caption2
    static let ColorChoiceSize : CGFloat = 40
    static let StarColor : Color = .yellow
}

enum UserDefConstants {
    static let ColorblindMode = "ColorblindMode"
    static let ColorblindModeDefault : ColorBlindMode = .blueOrange
}

enum ColorBlindMode : String, Codable, CaseIterable {
    case greenRed = "Green Red", blueOrange = "Blue Orange", blueRed = "Blue Red", blueBrown = "Blue Brown"
}

//func colorsToUse(_ colorblindMode : ColorBlindMode) -> (greenColor : Color, redColor : Color) {
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
