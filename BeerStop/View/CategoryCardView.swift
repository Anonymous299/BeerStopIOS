//
//  CategoryCardView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-09.
//

import SwiftUI

struct CategoryCardView: View {
    
    var image: Image!
    var text: String!
    
    var body: some View {
        NavigationLink(destination: SearchView(category: text)){
            VStack{
                LinearGradient.lairHorizontalDark
                    .mask(image.resizable().scaledToFit()).frame(width: 35, height: 35)
                    .padding(.top, 15)
                    .padding(.horizontal).shadow(color: .white, radius: 2, x: -3, y: -3)
                    .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
                Text(text).padding(.bottom,10).font(.custom("Raleway", size: 10)).foregroundColor(.black)
            }.overlay(
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

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCardView(image: Image("beer"), text: "Beer")
    }
}
