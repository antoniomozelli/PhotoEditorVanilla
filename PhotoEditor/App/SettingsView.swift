//
//  SettingsView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("isOnboarding") var isOnboarding : Bool = false
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 20) {
                    GroupBox(
                        label:
                                SettingsLabelView(labelText: "Vanilla", labelImage: "info.circle")
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10){
                            Image("logo_title")
                                .resizable()
                                .scaledToFit()
                                .frame(width:80, height:80)
                                .cornerRadius(9)
                            Text("Artistic photo filters designed with Artificial Intelligence")
                                .font(.headline)
                        }
                        
                    }
                    
                    GroupBox(label: SettingsLabelView(labelText: "Customization", labelImage: "gearshape")){
                        Divider().padding(.vertical, 4)
                        Text("Restart application and see welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.body)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        
                        Toggle(isOn: $isOnboarding){
                            Text("Restart".uppercased())
                                .font(.headline)
                        }
                        
                    }
                    
                    GroupBox(label: SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")){
                        
                        SettingsRowView(name: "Developer", content: "Antonio Mozelli")
                        SettingsRowView(name: "Designer", content: "Antonio Mozelli")
                        SettingsRowView(name: "Compatibility", content: "iOS 14+")
                        SettingsRowView(name: "Website", linkLabel: "antoniomozelli.com", linkDestination: "antoniomozelli.com")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    }
                }
                .navigationBarTitle(Text("Settings"),displayMode: .large)
                .padding()
            }
            
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
