//
//  SearchView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-10.
//

import SwiftUI

struct SearchView: View {
    
    @FetchRequest(sortDescriptors: []) var allAlcohols: FetchedResults<Alcohol>
    
    @State var categories: Set<String> = (["Wine", "Beer & Cider", "Spirits", "Coolers"])
    
    @FocusState var isSearching: Bool
    
    var initialIsSearching: Bool
    
    @State var subcategories: Set<String> = ([])
    
    @State var selectedSubcategories: Set<String> = ([])
    
    @State private var isFiltering = false
    
    @State private var query = ""
    
    @State private var price: Double = 0
    
    var body: some View {
        VStack(alignment: .leading){
            Button{
                isFiltering.toggle()
            } label: {
                Image("filter").resizable().frame(width: 20, height: 20).padding(.leading, 20)
            }
                .padding(.top, 10)
            if isFiltering{
                FilterView(categories: $categories, subcategories: subcategories, selectedSubcategories: $selectedSubcategories,
                price: $price)
            }
            SearchBar(text: $query).padding(.horizontal, 15).padding(.top, 10).focused($isSearching)
            SearchResultView(categories: categories, subcategories: selectedSubcategories,
                             query: query, price: price)
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .topLeading
        ).navigationTitle("Search").navigationBarTitleDisplayMode(.inline).onChange(of: categories){ _ in
            findSubcategories()
        }.onAppear{
            findSubcategories()
            isSearching = initialIsSearching
        }
    }
    
    private func findSubcategories(){
        var subcategorySet: Set<String> = ([])
        for alcohol in allAlcohols{
            if alcohol.category != nil && alcohol.subcategory != nil && categories.contains(alcohol.category!){
                subcategorySet.insert(alcohol.subcategory!)
            }
        }
        subcategories = subcategorySet
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(initialIsSearching: true)
    }
}
