//
//  ContentView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var alcoholStore: AlcoholStore = .shared
    
    
    
    var body: some View {
        HomeView()
    }
    
    private func fetchAlcohols() async {
        
        do {
            try await alcoholStore.fetchAlcohols()
        } catch {
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPad Air (5th generation)")
            .environment(\.managedObjectContext, AlcoholStore.shared.container.viewContext)
    }
}
