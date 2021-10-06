//
//  SubscriptionButton.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-08-13.
//

import SwiftUI

struct SubscriptionButton: View {
    var body: some View {
        Button(action:{
            print("Exit the onboarding")
        }){
            Text("Start with a 3 days free trial.")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(50)
                
                
            
        }
        
        
    }
}

struct SubscriptionButton_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionButton()
            .previewLayout(.sizeThatFits)
    }
}
