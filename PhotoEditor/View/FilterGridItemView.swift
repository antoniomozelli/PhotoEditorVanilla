//
//  FilterGridItemView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct FilterGridItemView: View {
    
    let filter: Filter
    
    var body: some View {
        Image(filter.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
        
    }
}

struct FilterGridItemView_Previews: PreviewProvider {
    
    static let filters: [Filter] = Bundle.main.decode("filters.json")
    
    static var previews: some View {
        FilterGridItemView(filter: filters[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
