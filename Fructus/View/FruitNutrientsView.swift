//
//  FruitNutrientsView.swift
//  Fructus
//
//  Created by Preeteesh Remalli on 02/01/26.
//

import SwiftUI

struct FruitNutrientsView: View {
    var fruit: Fruit
    let nutrients : [String] = ["Energy", "Sugar", "Fat", "Protien", "Vitamins", "Minerals"]

    var body: some View {
        GroupBox {
            DisclosureGroup("Nutrients value per 100g") {
                ForEach(0..<nutrients.count, id: \.self) { item in
                    Divider().padding(.vertical, 2)
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(nutrients[item])
                        }
                        .foregroundStyle(fruit.gradientColors[0])
                        .font(Font.system(.body).bold())
                        Spacer(minLength: 25)

                        Text(fruit.nutrition[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 480)) {
    FruitNutrientsView(fruit: fruitsData[0])
        .preferredColorScheme(.dark)
        .padding()
}
