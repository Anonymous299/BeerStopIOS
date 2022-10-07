//
//  BeerStopApp.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI

@main
struct BeerStopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
