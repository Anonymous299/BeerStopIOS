//
//  BeerStopApp.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI

@main
struct BeerStopApp: App {
    
//    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, AlcoholStore.shared.container.viewContext)
        }
    }
}
