//
//  CustomAnnotationView.swift
//  Africa
//
//  Created by Aviral on 23/04/21.
//

import SwiftUI

struct CustomAnnotationView: View {
    //MARK: - properties
    @State private var animation: Double = 0.0
    var location: LocationModel
    
    //MARK: - body
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.accentColor)
                .frame(width: 38, height: 38, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor,lineWidth: 2)
                .frame(width: 38, height: 38, alignment: .center)
                .scaleEffect(1+CGFloat(animation))
                .opacity(1-animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
                .clipShape(Circle())
        }.onAppear{
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)){
                animation = 1
            }
        }
    }
}

struct CustomAnnotationView_Previews: PreviewProvider {
    static let locations: [LocationModel] = Bundle.main.decode("locations.json")
    static var previews: some View {
        CustomAnnotationView(location: locations[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
