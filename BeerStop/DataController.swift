//
//  DataController.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "BeerStop")
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
