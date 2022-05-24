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

enum MessageConstants {
    static let TapForCompanyInfo = "Tap for info about the company."
}

enum UserDefConstants {
    static let ColorblindMode = "ColorblindMode"
    static let ColorblindModeDefault : ColorBlindMode = .greenRed
}

enum ColorBlindMode : String, Codable, CaseIterable {
    case greenRed = "Green Red",
         greenPurple = "Green Purple",
         blueOrange = "Blue Orange",
         blueRed = "Blue Red",
         blueBrown = "Blue Brown",
         cyanBrown = "Cyan Brown",
         yellowPink = "Yellow Pink"
}
