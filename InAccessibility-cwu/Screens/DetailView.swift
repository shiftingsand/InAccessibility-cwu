//
//  DetailView.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

enum AlertItem: String, Identifiable {
    case share
    case favorite
    
    var id: String { self.rawValue }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    @AppStorage(UserDefConstants.ColorblindMode) var colorBlindModeFound : ColorBlindMode = UserDefConstants.ColorblindModeDefault
    
    @State var selectedAlertItem: AlertItem?
    
    let stock: Stock
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    companyInfo
                    description
                    buttons
                }
                .padding(.horizontal)
                
                Text("Detailview")
                    //.navigationTitle(stock.name)
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .cancel) {
                        dismiss()
                    } label: {
                        Text("Done")
                            .accessibilityHint(Text("Dismiss this view."))
                    }
                }
            }
        }
        .alert(item: $selectedAlertItem, content: { item in
            if item == .share {
                return Alert(title: Text("Thanks for sharing!"))
            } else {
                return Alert(title: Text("Thanks for favoriting (but not really)!"))
            }
        })
    }
    
    var companyInfo: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Company Name")
                    .bold()
                    .font(.subheadline)
                    .underline()
                Text(stock.name)
                    //.font(.system(size: 24))
                    .font(.body)
                    .bold()
                
                HStack {
                    Text(stock.shortName)
                    //.font(.system(size: 12))
                        .font(.caption)
                        .accessibilityLabel(Text("Short Name \(stock.shortName)"))
                    
                    Spacer()
                    
                    StockGraph(stock: stock)
                }
            }
        }
            
        //    Spacer()
        //    StockGraph(stock: stock)
        //}
    }
    
    var description: some View {
        VStack(alignment: .leading) {
            Text("Company Description")
                .bold()
                .font(.subheadline)
                .underline()
            Text("This is a company that was founded at some point in time by some people with some ideas. The company makes products and they do other things as well. Some of these things go well, some don't. The company employs people, somewhere between 10 and 250.000. The exact amount is not currently available.")
                //.font(.system(size: 22))
                .font(.body)
        }
    }
    
    var buttons: some View {
        VStack {
            Button {
                selectedAlertItem = .share
            } label: {
                Text("Tap to share")
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(colorsToUse(modeToUse: colorBlindModeFound).greenColor)
            .controlSize(.large)
            
            // i've never seen a yellow button and can't shake the feeling the text was hard to read.
            Button {
                selectedAlertItem = .favorite
            } label: {
                Text("Favorite")
                .bold()
                .font(.title2)
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .tint(colorsToUse(modeToUse: colorBlindModeFound).redColor)
            .controlSize(.large)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(stock: .example())
    }
}
