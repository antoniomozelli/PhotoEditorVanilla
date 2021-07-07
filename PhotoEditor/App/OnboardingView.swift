//
//  OnboardingView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-01.
//

import SwiftUI

struct OnboardingView: View {
    
    var onboarding:[Onboarding] = onboardingData
    
    var body: some View {
        TabView{
            ForEach(onboarding[0...3]) { item in
                onboardingCardView(onboarding: item)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical,1)
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(onboarding: onboardingData)
    }
}
