//
//  Alcohol+CoreDataProperties.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-08.
//
//

import Foundation
import CoreData


extension Alcohol {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Alcohol> {
        return NSFetchRequest<Alcohol>(entityName: "Alcohol")
    }

    @NSManaged public var alcohol_content: Double
    @NSManaged public var brand: String?
    @NSManaged public var category: String?
    @NSManaged public var country: String?
    @NSManaged public var desc: String?
    @NSManaged public var id: Int32
    @NSManaged public var image_url: String?
    @NSManaged public var price: Double
    @NSManaged public var price_index: Double
    @NSManaged public var rating: Float
    @NSManaged public var subcategory: String?
    @NSManaged public var thumbnail_url: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?
    @NSManaged public var volume: Double
    
    /// Updates a Alcohol instance with the values from a AlcoholProperties.
    func update(from alcoholProperties: AlcoholProperties) throws {
        id = Int32(alcoholProperties.id)
        title = alcoholProperties.title
        brand = alcoholProperties.brand
        category = alcoholProperties.category
        subcategory = alcoholProperties.subcategory
        price = alcoholProperties.price
        volume = alcoholProperties.volume
        alcohol_content = alcoholProperties.alcohol_content
        price_index = alcoholProperties.price_index
        country = alcoholProperties.country
        url = alcoholProperties.url
        thumbnail_url = alcoholProperties.thumbnail_url
        image_url = alcoholProperties.image_url
        rating = alcoholProperties.rating ?? 0
        desc = alcoholProperties.desc
    }

}

extension Alcohol : Identifiable {

}
