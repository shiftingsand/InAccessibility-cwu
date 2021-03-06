//
//  ContentView.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct MainView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    @State var showDetailStock: Stock?
    
    var body: some View {
        NavigationView {
            List {
                favoriteStocksSection
                allStocksSection
            }
            .navigationTitle("Stocks")
            .toolbar(content: {
                toolbarItems
            })
            .sheet(item: $showDetailStock) { stock in
                DetailView(stock: stock)
            }
        }
    }
    
    var favoriteStocksSection: some View {
        Section {
            ForEach(Stock.favorites()) { stock in
                StockCell(stock: stock)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showDetailStock = stock
                    }
                    //.accessibilityAddTraits(.isButton)
                    //.accessibilityLabel(Text("Stock Cell"))
                    //.accessibilityHint(Text("Tap to show details."))
            }
        } header: {
            HStack {
                if dynamicTypeSize.isAccessibilitySize {
                    VStack {
                        FavoriteHeader()
                    }
                } else {
                    FavoriteHeader()
                }
            }
        } footer: {
            Text("Favorite stocks are updated every 1 minute.")
        }
        
    }
    
    var allStocksSection: some View {
        Section {
            ForEach(Stock.all()) { stock in
                StockCell(stock: stock)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        showDetailStock = stock
                    }
//                    .accessibilityAddTraits(.isButton)
//                    .accessibilityLabel(Text("Stock Cell"))
//                    .accessibilityHint(Text("Tap to show details."))
            }
        } header: {
            Text("All Stocks")
        }
    }
    
    var toolbarItems: some ToolbarContent {
        Group {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationLink(destination: Settings()) {
                    Text("\(Image(systemName: "gearshape.fill"))")
                        .accessibilityAddTraits(.isButton)
                        .accessibilityLabel(Text("Settings"))
                        .accessibilityHint(Text("Change the color scheme."))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
