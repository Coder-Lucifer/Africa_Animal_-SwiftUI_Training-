//
//  CoverImageView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct CoverImageView: View {
    
    //MARK: - properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    
    //MARK: - Body
    var body: some View {
        TabView{
            ForEach(coverImages){item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}


//MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoverImageView()
                .previewLayout(.fixed(width: 400, height: 300))
        }
    }
}
