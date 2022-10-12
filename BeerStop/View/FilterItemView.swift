//
//  FilterItemView.swift
//  BeerStop
//
//  Created by Sahil Pradhan on 2022-10-11.
//

import SwiftUI

struct FilterItemView: View {
    
    var text: String!
    
    @Binding var set: Set<String>
    
    var body: some View {
        Button{
            if set.contains(text) {
                set.remove(text)
            }
            else {
                set.insert(text)
            }
        } label: {
            Text(text).font(.custom("Raleway", size: 15)).foregroundColor(.black).frame(minWidth: 80).padding(.vertical, 2).padding(.horizontal, 4).overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(set.contains(text) ? Color.green: Color.black, lineWidth: 2))
        }
    }
}

struct FilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        FilterItemView(text: "Wine", set: .constant(["Spirits"]))
    }
}
