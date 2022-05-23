//
//  StockPrice.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockPrice: View {
    @AppStorage(UserDefConstants.ColorblindMode) var colorBlindModeFound : ColorBlindMode = UserDefConstants.ColorblindModeDefault
    
    let stock: Stock
    
    var body: some View {
        //VStack(alignment: .trailing, spacing: 2) {
        HStack {
            Text("\(String(format: "%.2f",stock.stockPrice))")
            // having these two Text Views be different sizes really screwed things up visually.
                .font(.caption)
                .accessibilityLabel(Text("Stock Price"))
            #warning("pretty up the currency")
            
            Spacer()
            
            Text("\(String(format: "%.2f",stock.change))")
                .bold()
                .font(.caption)
                .padding(4)
                .background(stock.goingUp ? colorsToUse(modeToUse: colorBlindModeFound).greenColor : colorsToUse(modeToUse: colorBlindModeFound).redColor)
                .cornerRadius(6)
                .foregroundColor(.white)
                .accessibilityLabel(Text("Stock Change"))
        }
    }
}


struct StockPrice_Previews: PreviewProvider {
    static var previews: some View {
        StockPrice(stock: .example())
    }
}
