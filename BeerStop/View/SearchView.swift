//
//  SearchView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-10.
//

import SwiftUI

struct SearchView: View {
    
    @State var category = "Spirits"
    
    var body: some View {
        VStack{
            SearchResultView(filter: category)
        }.navigationTitle("Search").navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
