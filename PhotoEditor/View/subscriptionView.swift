//
//  subscriptionView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-08-13.
//

import SwiftUI

struct subscriptionView: View {
    var body: some View {
        ZStack{
            Image("onboarding1")
                .resizable()
                .scaledToFill()
            VStack(spacing: 50) {
                LogoView()
                    .padding(.top, 100)
                Spacer()
                TextcarouselView()
                Spacer()
                VStack(spacing: 20) {
                    Divider()
                        SubscriptionButton()
                    Text("Privacy Policy")
                        .foregroundColor(.white)
                        .font(.footnote)
                }.padding(.bottom, 80)
            }
           
            
        }.cornerRadius(20)
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        .padding(.horizontal,20)
    }
}

struct subscriptionView_Previews: PreviewProvider {
    static var previews: some View {
        subscriptionView()
    }
}
