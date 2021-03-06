//
//  Settings.swift
//  InAccessibility
//
//  Created by Chris Wu on 5/22/22.
//

import SwiftUI

struct Settings: View {
    @AppStorage(UserDefConstants.ColorblindMode) var colorBlindModeFound : ColorBlindMode = UserDefConstants.ColorblindModeDefault
    @AppStorage(UserDefConstants.StarColor) var starColorFound : StarColors = UserDefConstants.StarColorDefault
    
    @State var starColorChoices : [ Color ] = [.yellow]
    
    var body: some View {
        Form {
            Section {
                Picker("Choose Colors For Stock Change", selection: $colorBlindModeFound) {
                    ForEach(ColorBlindMode.allCases, id:\.self) { oneColorMode in
                        VStack(alignment: .leading) {
                            Text("\(oneColorMode.rawValue)")
                            HStack {
                                Rectangle()
                                    .foregroundColor(colorsToUse(modeToUse: oneColorMode).greenColor)
                                    .frame(width: UIConstants.ColorChoiceSize, height: UIConstants.ColorChoiceSize)

                                Rectangle()
                                    .foregroundColor(colorsToUse(modeToUse: oneColorMode).redColor)
                                    .frame(width: UIConstants.ColorChoiceSize, height: UIConstants.ColorChoiceSize)
                            }
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(Text("Choose Colors For Stock Change"))
                        .accessibilityHint(Text("\(makeAccessibilityHints(colorMode: oneColorMode))"))
                    }
                }
                
                Picker("Choose Star Color", selection: $starColorFound) {
                    ForEach(StarColors.allCases, id:\.self) { oneStarColor in
                        VStack(alignment: .leading) {
                            Text("\(starColorToUse(desiredColor: oneStarColor).description)")
                            
                            Rectangle()
                                .foregroundColor(starColorToUse(desiredColor: oneStarColor))
                                .frame(width: UIConstants.ColorChoiceSize, height: UIConstants.ColorChoiceSize)
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(Text("Choose Star Color"))
                        .accessibilityHint(Text("A \(starColorToUse(desiredColor:oneStarColor).description) colored star will indicate a favorite."))
                    }
                }
            } header: {
                Text("Alternate Color Schemes")
            } footer: {
               Text("Choose what colors to use instead of a green/red combination.")
            }
        }
    }
    
    // props to Kris Slazinski for informing me you can use ".description" to get a color description.
    func makeAccessibilityHints(colorMode : ColorBlindMode) -> String {
        let greenPart : String
        let redPart : String
        let foundColors = colorsToUse(modeToUse: colorMode)
        
        if Color.green == foundColors.greenColor {
            greenPart = "\(foundColors.greenColor.description) will be used when the stock goes up. "
        } else {
            greenPart = "\(foundColors.greenColor.description) will be used instead of \(Color.green.description) when the stock goes up. "
        }
        
        if Color.red == foundColors.redColor {
            redPart = "\(foundColors.redColor.description) will be used when the stock goes down."
        } else {
            redPart = "\(foundColors.redColor.description) will be used instead of \(Color.red.description) when the stock goes down."
        }
        
        return greenPart + redPart
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
