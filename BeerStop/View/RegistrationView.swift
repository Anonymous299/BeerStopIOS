//
//  RegistrationView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-12.
//

import SwiftUI

struct RegistrationView: View {
    
    var alcoholStore: AlcoholStore = .shared
    
    @State private var name: String = ""
    @State private var submitPressed = false
    
    
    var body: some View {
        VStack{
            NavigationLink(destination: HomeView(name: name), isActive: $submitPressed) { EmptyView() }
            Text("Greetings! Enter your name")
            TextField("Enter name", text: $name)
                .padding(7)
                .padding(.horizontal, 25)
                .cornerRadius(8)
            Button{
                UserDefaults.standard.set(NSString(utf8String: name), forKey: "Name")
                submitPressed = true
            } label: {
                Text("Submit")
            }
        }.task {
            await fetchAlcohols()
        }
    }
    private func fetchAlcohols() async{
       
        do{
            try await alcoholStore.fetchAlcohols()
        } catch {
            print("Error fetching alcohols: \(error.localizedDescription)")
            
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
