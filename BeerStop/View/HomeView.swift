//
//  HomeView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-08.
//

import SwiftUI


struct HomeView: View {
    
    var alcoholStore: AlcoholStore = .shared
    
    @EnvironmentObject var alcoholDataManager: AlcoholDataManager
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.price_index)]) var alcohols: FetchedResults<Alcohol>
    
    var name: String!
    
    @State private var text: String = ""
    
    @State private var isError = false
    
    var body: some View {
        VStack{
            if !alcoholDataManager.alcoholList.isEmpty{
                VStack{
                    VStack(alignment: .leading){
                        Image("three-dots-ellipsis-svgrepo-com").resizable()
                            .frame(width: 35, height: 35)
                            .padding(.top, 8)
                        
                        Text("Hi, \(name)")
                            .font(.custom("PlayfairDisplay-Bold", size: 24)).padding(.top, 21)
                        Text("Start your search below")
                            .font(.custom("Raleway", size: 18)).padding(.top, 1)
                        MostEfficientCardView(alcohol: alcohols.first!)
                            
                            .padding(.top, 10)
                        NavigationLink(destination: SearchView(initialIsSearching: true)){
                            TextField("Search ...", text: $text)
                                .padding(7)
                                .padding(.horizontal, 25)
                                .background(Color(.systemGray6))
                                .cornerRadius(8).padding(.top, 40)
                        }
                        Text("Popular search categories")
                            .font(.custom("Raleway", size: 18)).padding(.top, 19)
                        
                    }.padding(.horizontal, 35)
                    HStack{
                        CategoryCardView(image: Image("wine_glass"), text: "Wine").padding(.leading, 15)
                        Spacer()
                        CategoryCardView(image: Image("beer_mug"), text: "Beer & Cider")
                        Spacer()
                        CategoryCardView(image: Image("spirit_glass"), text: "Spirits")
                        Spacer()
                        CategoryCardView(image: Image("cooler_can"), text: "Coolers").padding(.trailing, 15)
                        
                    }
                    Spacer()
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                ).navigationTitle("Home")
                    .navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true)
            }
            else if isError{
                Button{
                    Task{
                        await fetchAlcohols()
                    }
                } label: {
                    VStack{
                        Image("Goforward")
                        Text("Error getting alcohols. Tap to refresh")
                    }
                }
            }
            else{
                ProgressView(label: {
                    Text("Loading Alcohols")
                } ).task {
                    await fetchAlcohols()
                }
            }
        }.task {
            await fetchAlcohols()
        }
    }
    private func fetchAlcohols() async{
        DispatchQueue.main.async {
            isError = false
        }
//        do{
        alcoholDataManager.fetchAlcohols()
//        } catch {
//            print("Error fetching alcohols: \(error.localizedDescription)")
//            DispatchQueue.main.async {
//                isError = true
//            }
//        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
