//
//  enums.swift
//  InAccessibility-cwu
//
//  Created by Chris Wu on 5/26/22.
//

import Foundation

enum ColorBlindMode : String, Codable, CaseIterable {
    case greenRed = "Green Red",
         greenPurple = "Green Purple",
         blueOrange = "Blue Orange",
         blueRed = "Blue Red",
         blueBrown = "Blue Brown",
         cyanBrown = "Cyan Brown",
         yellowPink = "Yellow Pink"
}

enum AlertItem: String, Identifiable {
    case share
    case favorite
    
    var id: String { self.rawValue }
}

enum StarColors : String, Hashable, CaseIterable {
    case yellowStar, blueStar, cyanStar, redStar, purpleStar, orangeStar, brownStar, pinkStar
}
