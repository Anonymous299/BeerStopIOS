//
//  FilterView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-10.
//

import SwiftUI

let allCategories = ["Wine", "Beer & Cider", "Spirits", "Coolers"]

struct FilterView: View {
    
    @Binding var categories: Set<String>
    var subcategories: Set<String> = ([])
    @Binding var selectedSubcategories: Set<String>
    
    @Binding var price: Double
    
    var body: some View {
        VStack {
            VStack {
                HStack{
                    Spacer()
                    Text("Categories").font(.custom("PlayfairDisplay-Italic", size: 15))
                    Spacer()
                }
                HStack{
                    ScrollView(.horizontal){
                        HStack(spacing: 10){
                            Spacer()
                            ForEach(allCategories, id: \.self){ category in
                                FilterItemView(text: category, set: $categories)
                            }.padding(.vertical, 5)
                            Spacer()
                        }
                    }
                }
            }.padding(.top, 20)
            
            VStack {
                HStack{
                    Spacer()
                    Text("Subcategories").font(.custom("PlayfairDisplay-Italic", size: 15))
                    Spacer()
                }
                ScrollView(.horizontal){
                        HStack(spacing: 10){
                            Spacer()
                            ForEach(Array(subcategories), id: \.self){ subcategory in
                                FilterItemView(text: subcategory, set: $selectedSubcategories)
                            }.padding(.vertical, 5)
                            Spacer()
                        }
                }
            }.padding(.vertical, 10)
            
            VStack {
                HStack{
                    Spacer()
                    Text("Maximum price").font(.custom("PlayfairDisplay-Italic", size: 15))
                    Spacer()
                }
                HStack{
                    Slider(value: $price, in: 0...100000)
                    TextField("Enter maximum price", value: $price, format: .number)
                                    .textFieldStyle(.roundedBorder)
                                    .padding()

                }
            }
        }.padding(.horizontal, 5)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView(categories: .constant(["Wine"], subc))
//    }
//}
