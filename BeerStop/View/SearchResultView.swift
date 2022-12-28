//
//  SearchResultView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-10.
//

import SwiftUI

struct SearchResultView: View {
    
    @FetchRequest var fetchRequest: FetchedResults<Alcohol>
    
    @EnvironmentObject var alcoholDataManager: AlcoholDataManager
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    private var tempCategory: String
    
    init(categories: Set<String>, subcategories: Set<String>, query: String,
         price: Double) {
        _fetchRequest = FetchRequest<Alcohol>(sortDescriptors: [SortDescriptor(\.price_index)], predicate: NSCompoundPredicate(andPredicateWithSubpredicates: [NSPredicate(format: "category IN %@", categories), subcategories.isEmpty ? NSPredicate(value: true) : NSPredicate(format: "subcategory IN %@", subcategories), query.isEmpty ? NSPredicate(value: true) : NSCompoundPredicate(orPredicateWithSubpredicates: [NSPredicate(format: "title CONTAINS %@", query), NSPredicate(format: "category CONTAINS %@", query), NSPredicate(format: "subcategory CONTAINS %@", query)]),
                                                                                                                                                               price <= 0 ? NSPredicate(value: true) : NSPredicate(format: "price <= %f", price)]))
        tempCategory = categories.first!
       
    }
    
    var body: some View {
       
//        List(fetchRequest, id: \.id){ alcohol in
//            NavigationLink(destination: AlcoholDescriptionView(alcohol: alcohol)){
//                HStack{
//                    Text(alcohol.title!)
//                    Spacer()
//                    CircleImage(imageUrlString: alcohol.image_url)
//                }
//            }
//        }
        List{
            ForEach(alcoholDataManager.alcoholList, id: \.id){ alcohol in
                
                NavigationLink(destination: AlcoholDescriptionView(alcohol: Alcohol.create(in: managedObjectContext, properties: alcohol))){
                                HStack{
                                    Text(alcohol.title)
                                    Spacer()
                                    CircleImage(imageUrlString: alcohol.image_url)
                                }
                            }
            }
            
            if alcoholDataManager.alcoholListFull == false{
                ProgressView(label: {
                    Text("Loading more alcohols")
                } ).onAppear{
                    alcoholDataManager.fetchAlcohols(category: tempCategory)
                }
            }
        }
    }
    
    
}

//struct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView(categories: (["Spirits"]))
//    }
//}
