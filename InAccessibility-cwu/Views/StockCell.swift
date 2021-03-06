//
//  StockCell.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockCell: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @AppStorage(UserDefConstants.StarColor) var starColorFound : StarColors = UserDefConstants.StarColorDefault
    
    @State var showInfo = false
    
    let stock: Stock
    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Text(stock.shortName)
                    //.font(.system(size: 17))
                        .font(.body)
                        .bold()
                        .accessibilityLabel(Text("Short Name \(stock.shortName)"))
                        .accessibilityAddTraits(.isButton)
                        .accessibilityHint(Text(String(format: MessageConstants.TapForCompanyInfoWithArg, stock.shortName)))
                    
                    Spacer()
                    
                    //Image("info-icon")
                    Text("\(Image(systemName: "info.circle.fill"))")
                        .scaledToFit()
                        //.frame(width: 16, height: 16)
                        .font(UIConstants.SmallGraphicsSize)
                        .onTapGesture {
                            showInfo = true
                        }
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel(Text("Info"))
                        .accessibilityHint(Text("Shows current stock price for \(stock.shortName)."))
                    
                    Text("\(Image(systemName: "star.fill"))")
                    //Image(systemName: "star.fill")
                        .scaledToFit()
                        //.frame(width: 16, height: 16)
                        .font(UIConstants.SmallGraphicsSize)
                        .foregroundColor(starColorToUse(desiredColor: starColorFound))
                        .opacity(stock.favorite ? 1 : 0)
                        .accessibilityHidden(!stock.favorite)
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel(Text("Favorite indicator"))
                        .accessibilityHint(Text("A \(starColorToUse(desiredColor: starColorFound).description) star indicating \(stock.shortName) is a favorite company." + String(format: MessageConstants.TapForCompanyInfoWithArg, stock.shortName)))
                }
     
            }
            
            HStack {
                Text(stock.name)
                    .opacity(0.5)
                //.font(.system(size: 11))
                    .font(.caption)
                    .accessibilityLabel(Text("Stock Name \(stock.name)"))
                    .accessibilityAddTraits(.isButton)
                    .accessibilityHint(Text(String(format: MessageConstants.TapForCompanyInfoWithArg, stock.shortName)))
                
                Spacer()
                
                StockGraph(stock: stock)
            }
            
            Spacer()
                
            // if the values are really long then both of them wont fit on one line on small screen with huge text
            HStack {
                if dynamicTypeSize.isAccessibilitySize {
                    VStack {
                        StockPrice(stock: stock)
                    }
                } else {
                    StockPrice(stock: stock)
                }
            }
        }
        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 8))
        .alert(isPresented: $showInfo) {
            Alert(title: Text(stock.name), message: Text("The stock price for \(stock.name) (\(stock.shortName)) is \(prettyPrice(stock.stockPrice))."), dismissButton: .cancel())
        }
    }
}

struct StockCell_Previews: PreviewProvider {
    static var previews: some View {
        StockCell(stock: .example())
    }
}
