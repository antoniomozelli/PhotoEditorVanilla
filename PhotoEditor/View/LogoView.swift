//
//  LogoView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-02.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        VStack(spacing: 2) {
            LinearGradient(gradient: Gradient(colors: [Color("LogoColor1"),Color("LogoColor2")]),
                           startPoint: .top, endPoint: .bottom)
                .frame(height:30)
                        .mask(Text("Vanilla")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius:2, x: 2, y: 2 )
                    )
            Text("Photo Editor")
                .font(.headline)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius:2, x: 2, y: 2 )
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
    }
}
