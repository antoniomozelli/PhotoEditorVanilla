//
//  filterModel.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct Filter: Codable, Identifiable{
    let id: String
    let name : String
    let image : String
    
    /*let category: Category
    enum Category: String, CaseIterable, Codable {
        case fun = "Fun"
        case dark = "Dark"
        case happy = "Happy"
    }
 */
    let number : String
}
