//
//  MostEfficientCardView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-08.
//

import SwiftUI

struct MostEfficientCardView: View {
    
    var alcohol: Alcohol
    
    var body: some View {
        
        NavigationLink(destination: AlcoholDescriptionView(alcohol: self.alcohol)){
            HStack {
                VStack {
                    Text(alcohol.title!)
                    
                        .font(.custom("PlayfairDisplay-Bold", size: 24)).lineLimit(2)
                        .multilineTextAlignment(.center)
                    
                    
                    Text("The LCBO's most efficient product")
                    
                    
                        .font(.custom("Raleway", size: 10)).lineLimit(2).multilineTextAlignment(.center)
                }.padding(.leading, 10) .foregroundColor(.lairDarkGray)
                
                Spacer()
                
                CircleImage(imageUrlString: alcohol.image_url).padding(.trailing, 30)
                    .padding(.top, 10)
                    .padding(.bottom, 10)
            }.frame(maxWidth: 400).overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(LinearGradient.lairDiagonalDarkBorder, lineWidth: 2)
            )
            .background(Color.lairBackgroundGray)
            .cornerRadius(15)
            .shadow(
                color: Color.lairShadowGray.opacity(0.5),
                radius: 14,
                x: 14,
                y: 14)
        }
    }
}

//struct MostEfficientCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        MostEfficientCardView(alcohol: Alcohol()!)
//    }
//}
