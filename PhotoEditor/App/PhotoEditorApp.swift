//
//  PhotoEditorApp.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-01.
//

import SwiftUI

@main
struct PhotoEditorApp: App {
    
    @AppStorage("isOnboarding") var isOboarding: Bool = true
    
    var body: some Scene {
        WindowGroup {
            if isOboarding{
                OnboardingView()
            }else{
                ContentView()
            }
            
        }
    }
}
