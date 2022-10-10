//
//  SearchResultView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-10.
//

import SwiftUI

struct SearchResultView: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Alcohol>
    
    init(filter: String) {
        _fetchRequest = FetchRequest<Alcohol>(sortDescriptors: [SortDescriptor(\.price_index)], predicate: NSPredicate(format: "category == %@", filter))
    }
    
    var body: some View {
        List(fetchRequest, id: \.id){ alcohol in
            NavigationLink(destination: AlcoholDescriptionView(alcohol: alcohol)){
                HStack{
                    Text(alcohol.title!)
                    Spacer()
                    CircleImage(imageUrlString: alcohol.image_url)
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(filter: "Spirits")
    }
}
