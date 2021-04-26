         //
//  AnimalDetailView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct AnimalDetailView: View {
    //MARK: - properties
    let animal: Animal
    
    
    //MARK: - Body
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 20, content: {
                
                //Hero Image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                //Title
                Text(animal.name)
                    .font(.system(size: 34, weight: .heavy, design: .default))
                    .multilineTextAlignment(.center)
                    .padding(.vertical,8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.frame(height:6).offset(y:24))
                
                //Headline
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
   
                //Gallery
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness In Pictures")
                    InsetGalleryView(animal: animal)
                }.padding(.horizontal)
                
                
                //Facts
                Group{
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
                    InsetFactView(animal: animal)
                }.padding(.horizontal)
                
                
                
                //Decription
                Group{
                    HeadingView(headingImage: "info.circle", headingText: "Learn About \(animal.name)")
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }.padding(.horizontal)
                
                
                //Map
                
                Group{
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    InsetMapView()
                }.padding(.horizontal)
                
                //Link
                Group{
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }.padding(.horizontal)
                
            })
            .navigationBarTitle("Learn About \(animal.name)",displayMode: .inline)
        }
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[1])
        }
    }
}
