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
    
    static var preview: Alcohol {
        let alcohols = Alcohol.makePreviews(count: 1)
        return alcohols[0]
    }

    @discardableResult
    static func makePreviews(count: Int) -> [Alcohol] {
        var alcohols = [Alcohol]()
        let viewContext = AlcoholStore.preview.container.viewContext
        for index in 0..<count {
            let alcohol = Alcohol(context: viewContext)
            alcohol.id = Int32(index)
            alcohol.title = "Kelly's"
            alcohol.brand = "Kelly's"
            alcohol.category = "Wine"
            alcohol.subcategory = "Fortified Wine"
            alcohol.price = 12.45
            alcohol.volume = 1000
            alcohol.alcohol_content = 20
            alcohol.price_index = 0.06225
            alcohol.country = "Canada"
            alcohol.url = "https://www.lcbo.com/en/kelly-s-625988"
            alcohol.thumbnail_url = "https://aem.lcbo.com/content/dam/lcbo/products/6/2/5/9/625988.jpg.thumb.319.319.png"
            alcohol.image_url = "https://aem.lcbo.com/content/dam/lcbo/products/6/2/5/9/625988.jpg.thumb.1280.1280.png"
            alcohol.rating = 5
            alcohol.desc = "With a loyal customer base, Kelly's has stayed true to its unique recipe. Expect aromas and flavours of berry compote, smoke, citrus, cantaloupe and ripe pear. Light to medium-bodied and sweet, this is the ideal choice for creating an adult version of a fruit cocktail, or use it for a red sangria-style beverage."
            alcohols.append(alcohol)
        }
        return alcohols
    }
}

extension Alcohol : Identifiable {

}
