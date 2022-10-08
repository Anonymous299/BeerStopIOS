//
//  Alcohol.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import Foundation

struct Alcohol: Codable, Identifiable {
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
    var description: String
    
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
        case description
    }
}
