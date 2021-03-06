//
//  FavoriteHeader.swift
//  InAccessibility
//
//  Created by Chris Wu on 5/21/22.
//

import SwiftUI

struct FavoriteHeader: View {
    var body: some View {
        Group {
            Text("Favorite Stocks")
            Spacer()
            Button {
                
            } label: {
                Text("Tap for more")
            }
            .accessibilityHint(Text("Performs some action known only to Jordi."))
        }
    }
}

struct FavoriteHeader_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteHeader()
    }
}
