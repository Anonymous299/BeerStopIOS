//
//  RatingView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-09.
//

import SwiftUI

struct RatingView: View {
    
    var rating: Float!
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var maximumRating = 5
    
    var offImage = Image(systemName: "star")
    var onImage = Image(systemName: "star.fill")
    
    
    var body: some View {
        HStack{
            
            ForEach(0..<Int(rating.rounded(.down)), id: \.self){ _ in
                Image(systemName: "star.fill").foregroundColor(onColor)
            }
            if rating != rating.rounded(.down){
                Image(systemName: "star.leadinghalf.fill").foregroundColor(onColor)
                ForEach(Int(rating.rounded(.down))..<4, id: \.self){ _ in
                    Image(systemName: "star").foregroundColor(onColor)
                }
            }
            else {
                ForEach(Int(rating.rounded(.down))..<5, id: \.self){ _ in
                    Image(systemName: "star").foregroundColor(onColor)
                }
            }
        }
    }
    
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 3)
    }
}
