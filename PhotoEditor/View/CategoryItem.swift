//
//  CategoryItem.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-08-04.
//

import SwiftUI

struct CategoryItem: View {
    var filter: Filter
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(filter.image)
                    .resizable()
                .shadow(radius: 5)
                    .frame(width: 100, height: 100)
                    .cornerRadius(5)
            Text(filter.name)
                .font(.caption)
        }
        .padding(.leading, 10)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static let filters: [Filter] = Bundle.main.decode("filters.json")
    
    static var previews: some View {
        CategoryItem(filter: filters[0])
    }
}
