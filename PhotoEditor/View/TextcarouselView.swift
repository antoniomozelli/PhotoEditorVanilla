//
//  TextcarouselView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-08-13.
//

import SwiftUI

struct TextcarouselView: View {
    
    let textCarrousel = [
        "Turn Photos into Art",
        "Filters Never Seen Before",
        "Exclusive Style",
    "Designed with AI"]
    
    var body: some View {
        TabView{
            ForEach(textCarrousel, id: \.self) { item in
                            Text(item.description)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundColor(Color.white)
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct TextcarouselView_Previews: PreviewProvider {
    static var previews: some View {
        TextcarouselView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            .previewLayout(.fixed(width: 300, height: 200))
    }
}
