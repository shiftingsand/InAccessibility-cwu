//
//  Settings.swift
//  InAccessibility
//
//  Created by Chris Wu on 5/22/22.
//

import SwiftUI

struct Settings: View {
    @AppStorage(UserDefConstants.ColorblindMode) var colorBlindModeFound : ColorBlindMode = UserDefConstants.ColorblindModeDefault
    
    var body: some View {
        Form {
            Section {
                Picker("Choose colors", selection: $colorBlindModeFound) {
                    ForEach(ColorBlindMode.allCases, id:\.self) { oneColor in
                        VStack(alignment: .leading) {
                            Text("\(oneColor.rawValue)")
                            HStack {
                                Rectangle()
                                    .foregroundColor(colorsToUse(modeToUse: oneColor).greenColor)
                                    .frame(width: UIConstants.ColorChoiceSize, height: UIConstants.ColorChoiceSize)

                                Rectangle()
                                    .foregroundColor(colorsToUse(modeToUse: oneColor).redColor)
                                    .frame(width: UIConstants.ColorChoiceSize, height: UIConstants.ColorChoiceSize)
                            }
                        }
                        .accessibilityElement(children: .combine)
                        .accessibilityLabel(Text("Choose colors"))
                        .accessibilityHint(Text("\(colorsToUse(modeToUse: oneColor).greenColor.description) being used for the \"green\" color and \(colorsToUse(modeToUse: oneColor).redColor.description) being used for the \"red\" color."))
                    }
                }
            } header: {
                Text("Colorblind mode")
            } footer: {
               Text("Choose what colors to use instead of a green/red combination.")
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
