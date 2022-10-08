//
//  ContentView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @EnvironmentObject var alcoholStore: AlcoholStore
    
    var body: some View {
        List(alcoholStore.alcohols) { alcohol in
            Text(alcohol.title)
        }
    }
}
