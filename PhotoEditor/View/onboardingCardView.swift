//
//  onboardingCardView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-01.
//

import SwiftUI

struct onboardingCardView: View {
    
    var onboarding: Onboarding
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack{
            Image(onboarding.image)
                .resizable()
                .scaledToFill()
            VStack(spacing: 50) {
                LogoView()
                    .padding(.top, 100)
                Spacer()
                VStack(spacing: 20) {
                    Text(onboarding.headline)
                        .font(.title2)
                        .foregroundColor(.white)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius:2, x: 2, y: 2 )
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: 300)
                        
                        StartButtonView()
                }.padding(.bottom, 80)
            }
            .onAppear{
                //withAnimation(.easeOut(duration: 0.5)){
                    isAnimating = true
                //}
            }
           
            
        }.cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding(.horizontal,20)
    }
}

struct onboardingCardView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingCardView(onboarding: onboardingData[0])
            .previewLayout(.fixed(width: 320, height: 640))
    }
}
