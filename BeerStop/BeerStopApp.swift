//
//  BeerStopApp.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI

@main
struct BeerStopApp: App {
    @StateObject var alcoholStore = AlcoholStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(alcoholStore)
        }
    }
}
