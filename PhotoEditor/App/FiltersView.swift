//
//  FiltersView.swift
//  PhotoEditor
//
//  Created by Antonio Mozelli on 2021-07-15.
//

import SwiftUI

struct FiltersView: View {
    
    let filters: [Filter] = Bundle.main.decode("filters.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    let gridlayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        NavigationView{
          
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height:300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(filters) { filter in
                            NavigationLink(destination: ContentView()){
                                filterView(filter: filter)
                            }
                        }
                        
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridlayout, alignment: .center, spacing:10) {
                            ForEach(filters) { filter in
                                NavigationLink(destination: ContentView()){
                                FilterGridItemView(filter: filter)
                                }
                            }
                        }
                        .padding()
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                    }
                }
                
            }
            .navigationBarTitle("Filters", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                HStack(spacing:16){
                    Button(action: {
                        print("list view is activated")
                        isGridViewActive = false
                        haptics.impactOccurred()
                    }){
                        Image(systemName: "square.fill.text.grid.1x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .primary : .accentColor)
                    }
                    
                    Button(action: {
                        print("grid view is activated")
                        isGridViewActive = true
                        haptics.impactOccurred()
                    }){
                        Image(systemName: "square.grid.2x2")
                            .font(.title2)
                            .foregroundColor(isGridViewActive ? .accentColor : .primary)
                    }
                }
            }
            }
             }
    }
}

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView()
    }
}
