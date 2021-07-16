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
            CameraView()
                .tabItem{
                    Image(systemName: "camera")
                    Text("Camera")
                }
            FiltersView()
                .tabItem{
                    Image(systemName: "paintbrush.pointed")
                    Text("Filters")
                }
            GalleryView()
                .tabItem{
                    Image(systemName: "photo.on.rectangle")
                    Text("Gallery")
                }
            SettingsView()
                .tabItem{
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
