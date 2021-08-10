//
//  MainView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct MainView: View {
    

    var body: some View {
        TabView{
            
            ContentView()
                .tabItem{
                    Image(systemName: "paintbrush.pointed")
                    Text("Filters")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "info.circle")
                    Text("Info")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    
    static let filters: [Filter] = Bundle.main.decode("filters.json")
    
    static var previews: some View {
        MainView()
    }
}
