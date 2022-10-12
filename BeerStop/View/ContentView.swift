//
//  ContentView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-07.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    private var name: String? = nil
    
    init(){
    
        if let data = UserDefaults.standard.string(forKey: "Name") {
            print(data)
            name = data
                    return
                }
    }
    
    var body: some View {
        NavigationView {
           
            if name != nil{
                HomeView(name: name)
            }
            else{
                RegistrationView()
            }

        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, AlcoholStore.shared.container.viewContext)
    }
}
