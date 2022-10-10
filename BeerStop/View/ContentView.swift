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
        NavigationView {
            HomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, AlcoholStore.shared.container.viewContext)
    }
}
