//
//  AnimalRowListView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct AnimalRowListView: View {
    //MARK: - properties
    let animal: Animal
    
    
    
    
    //MARK: - body
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            VStack(alignment: .leading, spacing: 8) {
                Text(animal.name)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(.accentColor)
                
                Text(animal.description)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing,8)
            }
        }
    }
}


struct AnimalRowListView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalRowListView(animal: animal[2])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
