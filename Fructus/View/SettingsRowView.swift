//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Preeteesh Remalli on 02/01/26.
//

import SwiftUI

struct SettingsRowView: View {
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDescription: String? = nil

    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundStyle(.gray)
                Spacer()
                if let content {
                    Text(content)
                } else if let linkLabel, let linkDescription {
                    Link(linkLabel, destination: URL(string: linkDescription)!)
                    Image(systemName: "arrow.up.right.square").foregroundStyle(.pink)
                } else {
                    EmptyView()
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SettingsRowView(name: "Developer", content: "Preeteesh Remalli")
        .padding()

}

#Preview(traits: .sizeThatFitsLayout) {
    SettingsRowView(name: "Developer", linkLabel: "Link", linkDescription: "https://google.com")
        .padding()
}
