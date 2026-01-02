//
//  ContentView.swift
//  Fructus
//
//  Created by Preeteesh Remalli on 02/01/26.
//

import SwiftUI

struct ContentView: View {
    var fruits : [Fruit] = fruitsData
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetail(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 10)
                    }
                }
            }
            .listStyle(.plain)
            .environment(\.defaultMinListRowHeight, 44)
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    ContentView()
}
