//
//  WorkManager.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-11-27.
//

import Foundation

class NetworkManager {
    let base_url = URL(string: "http://68.183.108.111/api/alcohol?sortBy=price_index")!
    
    var currentUrl: URL? = nil
    
    func resumeFetch(){
        if(currentUrl == nil){
            currentUrl = self.base_url
        }
        
    }
}
