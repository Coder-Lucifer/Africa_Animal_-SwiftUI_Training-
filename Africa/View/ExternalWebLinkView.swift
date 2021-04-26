//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    //MARK: - properties
    let animal:Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name,destination: (URL(string: animal.link) ?? URL(string: "Https://wikipedia.org"))!)
                }.foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        ExternalWebLinkView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
