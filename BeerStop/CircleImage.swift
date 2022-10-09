//
//  CircleImage.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-08.
//

import SwiftUI
import Kingfisher

struct CircleImage: View {
    
    var imageUrlString: String?
    
    var body: some View {
        if imageUrlString == nil{
            Image("beer").resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:100, height: 100)
                .background(Color.white)
                .clipShape(Circle())
                .overlay {
                    LinearGradient.lairHorizontalDark.mask(Circle().stroke(.blue, lineWidth: 4))
                        .shadow(color: .white, radius: 2, x: -3, y: -3)
                        .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
                } }else {
                    KFImage(URL(string: imageUrlString!)).resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100, height: 100)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay {
                            LinearGradient.lairHorizontalDark.mask(Circle().stroke(.blue, lineWidth: 4))
                                .shadow(color: .white, radius: 2, x: -3, y: -3)
                                .shadow(color: .lairShadowGray, radius: 2, x: 3, y: 3)
                        }
                }
        }
    }
    
    struct CircleImage_Previews: PreviewProvider {
        static var previews: some View {
            CircleImage(imageUrlString: nil)
        }
    }

