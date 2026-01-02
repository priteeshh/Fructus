//
//  SettingsView.swift
//  Fructus
//
//  Created by Preeteesh Remalli on 02/01/26.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dissmiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    @State private var dismissTask: Task<Void, Never>? = nil
    @State private var wantsReset = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    GroupBox(label: SettingsLabelView(labelText: "Fructus", labelImage: "info.circle"), content: {
                        Divider().padding(.vertical, 10)
                        
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        }
                    })
                    
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "paintbrush"), content: {
                        Divider().padding(.vertical, 4)
                        
                        Text("If you wish, you can restart the application by toggle the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)

                        Toggle("Reset", isOn: $wantsReset)
                            .tint(wantsReset ? .green : .secondary)
                            .onChange(of: wantsReset) { _, newValue in
                                dismissTask?.cancel()
                                guard newValue == true else { return }
                                dismissTask = Task { @MainActor in
                                    try? await Task.sleep(for: .seconds(3))
                                    isOnboarding = true
                                    dissmiss()
                                }
                            }
                            .padding()
                            .background {
                                Color(.tertiarySystemBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 8.0, style: .continuous))
                            }
                    })

                    GroupBox(label: SettingsLabelView(labelText: "Developer", labelImage: "apps.iphone"), content: {
                        SettingsRowView(name: "Developer", content: "Preeteesh Remalli")
                        SettingsRowView(name: "Compatablity", content: "iOS 26")
                        SettingsRowView(name: "Website", linkLabel: "Link", linkDescription: "https://www.google.com")
                        SettingsRowView(name: "SwiftUI", content: "6.0")
                        SettingsRowView(name: "Version", content: "1.0")
                    })
                    
                }
                .navigationTitle("Settings")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button(action: {
                            dissmiss()
                        }, label: {
                            Image(systemName: "xmark")
                        })
                    })
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    SettingsView()
}
