//
//  Alcohol.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import Foundation
import CoreData



struct AlcoholProperties: Codable {
    var id: Int
    var title: String
    var brand: String?
    var category: String
    var subcategory: String
    var price: Double
    var volume: Double
    var alcohol_content: Double
    var price_index: Double
    var country: String
    var url: String
    var thumbnail_url: String
    var image_url: String?
    var rating: Float?
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case id = "permanent_id"
        case title
        case brand
        case category
        case subcategory
        case price
        case volume
        case alcohol_content
        case price_index
        case country
        case url
        case thumbnail_url
        case image_url
        case rating
        case desc = "description"
    }
    
    // The keys must have the same name as the attributes of the Quake entity.
    var dictionaryValue: [String: Any?] {
        [
            "id": id,
            "title": title,
            "brand": brand,
            "category": category,
            "subcategory": subcategory,
            "price": price,
            "volume": volume,
            "alcohol_content": alcohol_content,
            "price_index": price_index,
            "country": country,
            "url": url,
            "thumbnail_url": thumbnail_url,
            "image_url": image_url,
            "rating": rating,
            "desc": desc,
        ]
    }
}
