//
//  AlcoholDescriptionView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-09.
//

import SwiftUI
import Kingfisher

struct AlcoholDescriptionView: View {
    var alcohol: Alcohol!
    
    @State private var offset = -0.5*UIScreen.main.bounds.width
    var body: some View {
        ZStack{
            if alcohol.image_url == nil || alcohol.image_url!.isEmpty{
                Image("beer")
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height/1.5).offset(x: offset)
            }
            else{
                KFImage(URL(string: alcohol.image_url!))
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height/1.5).offset(x: offset)
            }
            ScrollView{
                VStack(alignment: .center){
                    Text(alcohol.title!)
                        .font(.custom("PlayfairDisplay-Bold", size: 32)).multilineTextAlignment(.center)
                    Text(alcohol.brand ?? alcohol.title!)
                        .font(.custom("Raleway", size: 18))
                        .padding(.top, 1)
                    RatingView(rating: alcohol.rating).padding(.top, 1)
                    Group {
                        Text("Category").font(.custom("PlayfairDisplay-Regular", size: 12)).padding(.top,15)
                        Text(alcohol.category!)
                            .font(.custom("Raleway", size: 10))
                            .padding(.top, 1)
                        Text("Subcategory").font(.custom("PlayfairDisplay-Regular", size: 12)).padding(.top,15)
                        Text(alcohol.subcategory!)
                            .font(.custom("Raleway", size: 10))
                            .padding(.top, 1)
                        Text(String(format: "$ %.2f", alcohol.price)).font(.custom("PlayfairDisplay-Bold", size: 30))
                            .padding(.top, 1)
                        Text("Efficiency").font(.custom("PlayfairDisplay-Bold", size: 15))
                            .padding(.top, 1)
                        if alcohol.price_index < 0.1 {
                            Text(String(format: "$ %.2f/mL", alcohol.price_index)).font(.custom("PlayfairDisplay-Bold", size: 20))
                                .padding(.top, 1).foregroundColor(.green)
                        }
                        else if alcohol.price_index < 0.15 {
                            Text(String(format: "$ %.2f", alcohol.price_index)).font(.custom("PlayfairDisplay-Bold", size: 20))
                                .padding(.top, 1).foregroundColor(.yellow)
                        }
                        else{
                            Text(String(format: "$ %.2f", alcohol.price_index)).font(.custom("PlayfairDisplay-Bold", size: 20))
                                .padding(.top, 1).foregroundColor(.red)
                        }
                        Text("Description").font(.custom("PlayfairDisplay-Regular", size: 12)).padding(.top,15)
                        Text(alcohol.desc!)
                            .font(.custom("Raleway", size: 10)).multilineTextAlignment(.center).padding(.top, 1)
                    }
                    
                    Spacer()
                }.frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    alignment: .topLeading
                ).padding(.leading, UIScreen.main.bounds.width * 0.4)
                    .padding(.trailing,30)
                    .padding(.top, 40)
            }
            
        }.onWillDisappear{
            offset = 0
        }
        
    }
}

struct AlcoholDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        AlcoholDescriptionView(alcohol: .preview)
            .previewDevice("iPhone SE (3rd generation)")
    }
}
