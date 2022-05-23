//
//  StockGraph.swift
//  InAccessibility
//
//  Created by Jordi Bruin on 19/05/2022.
//

import SwiftUI

struct StockGraph: View {
    @Environment(\.colorScheme) var colorScheme
    
    @AppStorage(UserDefConstants.ColorblindMode) var colorBlindModeFound : ColorBlindMode = UserDefConstants.ColorblindModeDefault
    
    let stock: Stock
    
    let points: [Int] = [10, 20, 30, 40, 30,25,44]
    
    var graphColorToUse : Color {
        return colorScheme == .dark ? .white : .black
    }
    
    @State var bigCircles = true
    @State var showDots = false
    
    var body: some View {
        ZStack {
            graphColorToUse.opacity(0.9)
                .cornerRadius(7)
                .frame(width: 100, height: 50)
            
            HStack(spacing: bigCircles ? 2 : 8) {
                ForEach(points, id: \.self) { point in
                    Circle()
                        .frame(width: bigCircles ? 10 : 4, height: bigCircles ? 10 : 4)
                        .foregroundColor(stock.goingUp ? colorsToUse(modeToUse: colorBlindModeFound).greenColor : colorsToUse(modeToUse: colorBlindModeFound).redColor)
                        .offset(y: CGFloat(stock.goingUp ? -point : point) * 0.3)
                }
            }
            .opacity(showDots ? 1 : 0)
            .offset(y: showDots ? 0 : 12)
            .animation(.default, value: showDots)
            .accessibilityHidden(!showDots)
            .accessibilityChildren {
                //let allPoints = points.map { String($0)}.joined(separator: ",")
                // props to Stefan Blos for reminding me that ".formatted" can add 'and' to the end of the string.
                let allPoints = points.map {String($0)}.formatted(.list(type: .and, width: .standard))
                Text("Stock Graph points are \(allPoints)")
                    .accessibilityHint(bigCircles ? Text("Show small circles.") : Text("Show big circles."))
                    .accessibilityAddTraits(.isButton)
            }
        }
        .onAppear {
            showDots = true
            bigCircles.toggle()
        }
        .onTapGesture {
            withAnimation(.spring()) {
                bigCircles.toggle()
            }
        }
    }
}

struct StockGraph_Previews: PreviewProvider {
    static var previews: some View {
        StockGraph(stock: .example())
    }
}
