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
}

enum MessageConstants {
    //static let TapForCompanyInfo = "Shows details about the company."
    static let TapForCompanyInfoWithArg = "Shows details about %@."
}

enum UserDefConstants {
    static let Start = "InAccessibility" // so the entries added by this app to userdefaults can be easily found and deleted later if so desired.
    static let ColorblindMode = Start + "ColorblindMode"
    static let StarColor = Start + "StarColor"
    static let ColorblindModeDefault : ColorBlindMode = .greenRed
    static let StarColorDefault : StarColors = .yellowStar
}

