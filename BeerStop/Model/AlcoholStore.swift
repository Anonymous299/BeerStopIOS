//
//  AlcoholStore.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import Foundation

class AlcoholStore: ObservableObject {
    
    @Published var alcohols = [Alcohol]()
    
    private let session: URLSession = {
            let config = URLSessionConfiguration.default
            return URLSession(configuration: config)
        }()
    init(){
        let url = AlcoholAPI.allAlcoholsURL
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            let result = self.processAlcoholRequest(data: data, error: error)
            OperationQueue.main.addOperation {
                switch result {
                case let .success(alcohols):
                print("Successfully found \(alcohols.count) alcohols.")
                    self.alcohols = alcohols
                                case let .failure(error):
                                    print("Error fetching alcohols: \(error)")
                }
            }
    }
        task.resume()
    }
    
    private func processAlcoholRequest(data: Data?,
                                      error: Error?) -> Result<[Alcohol], Error> {
        guard let jsonData = data else {
            return .failure(error!)
        }
        return AlcoholAPI.alcohols(fromJSON: jsonData)
    }
}
