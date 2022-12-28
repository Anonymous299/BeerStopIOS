//
//  AlcoholData.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-12-24.
//

import Foundation
import Combine

class AlcoholDataManager: ObservableObject{
    @Published var alcoholList = [AlcoholProperties]()
    
    // Tells if all records have been loaded. (Used to hide/show activity spinner)
        var alcoholListFull = false
        // Tracks last page loaded. Used to load next page (current + 1)
        var currentPage = 0
        
    
    let base_url = URL(string: "http://68.183.108.111/api/alcohol?sortBy=price_index")!
        private var cancellable: AnyCancellable?
    
    func fetchAlcohols(){
        cancellable = URLSession.shared.dataTaskPublisher(for: base_url)
            .tryMap{
                $0.data
            }.decode(type: AlcoholData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .catch{_ in Just(AlcoholData(data: self.alcoholList))}
            .sink{[weak self] in
                self?.currentPage += 1
                self?.alcoholList.append(contentsOf: $0.data)
                
                if $0.meta?.current_page == $0.meta?.last_page{
                    self?.alcoholListFull = true
                }
            }
        
    }
    
    func fetchAlcohols(category: String){
        cancellable = URLSession.shared.dataTaskPublisher(for: URL(string: "\(base_url.absoluteString)&category=\(category)&page=\(currentPage)")!)
            .tryMap{
                $0.data
            }.decode(type: AlcoholData.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .catch{_ in Just(AlcoholData(data: self.alcoholList))}
            .sink{[weak self] in
                self?.currentPage += 1
                self?.alcoholList.append(contentsOf: $0.data)
                
                if $0.meta?.current_page == $0.meta?.last_page{
                    self?.alcoholListFull = true
                }
            }
    }
}
