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
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.price_index)]) var alcohols: FetchedResults<Alcohol>
    
    var body: some View {
        VStack{
            Button{
                print("count: \(alcohols.count)")
            } label: {
                Label("Press", systemImage: "star")
            }
            List(alcohols) { alcohol in
                Text(alcohol.title ?? "Bob")
            }.refreshable {
                await fetchAlcohols()
            }
        }
    }
    
    private func fetchAlcohols() async {
        
        do {
            try await alcoholStore.fetchAlcohols()
        } catch {
           
        }
        
    }
}
