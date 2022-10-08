//
//  AlcoholAPI.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import Foundation

//enum Endpoint: String {
//    case allAlcoholsEndpoint = "api/alcohol?numberOfResults=9999999999"
//}
//
//struct AlcoholAPI {
//    private static let baseUrl: String = "http://68.183.108.111/"
//
//    private static func alcoholURL(endPoint: Endpoint) -> URL {
//        let url = baseUrl + endPoint.rawValue
//        let components = URLComponents(string: url)!
//        return components.url!
//    }
//
//    static var allAlcoholsURL: URL {
//        return alcoholURL(endPoint: .allAlcoholsEndpoint)
//    }
//
//    static func alcohols(fromJSON data: Data) -> Result<[Alcohol], Error> {
//        do {
//            let decoder = JSONDecoder()
//            let alcoholResponse = try decoder.decode([Alcohol].self, from: data)
//            return .success(alcoholResponse)
//    } catch {
//            return .failure(error)
//        }
//    }
//}
//
//enum AlcoholPhotoError: Error {
//    case imageCreationError
//    case missingImageURL
//}
