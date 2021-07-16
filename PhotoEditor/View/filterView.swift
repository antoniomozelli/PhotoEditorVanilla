//
//  filterView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct filterView: View {
    
    let filter: Filter
    
    var body: some View {
        HStack(alignment: .center, spacing:16 ) {
            Image(filter.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            VStack(alignment: .leading, spacing: 8) {
                Text(filter.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                Text("lorem ipsum")
            }
        }
    }
}

struct filterView_Previews: PreviewProvider {
    
    static let filters: [Filter] = Bundle.main.decode("filters.json")
    
    static var previews: some View {
        filterView(filter: filters[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
