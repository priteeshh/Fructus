//
//  SettingsViewLabel.swift
//  Fructus
//
//  Created by Preeteesh Remalli on 02/01/26.
//

import SwiftUI

struct SettingsLabelView: View {
    var labelText: String
    var labelImage: String

    var body: some View {
        HStack {
            Text(labelText.uppercased())
            Spacer()
            Image(systemName: labelImage)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
        .padding()
}
