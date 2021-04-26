//
//  InsetFactView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct InsetFactView: View {
    //MARK: - properties
    let animal: Animal
    
    //MARK: - body
    var body: some View {
        GroupBox {
            TabView{
                ForEach(animal.fact,id: \.self){fact in
                    Text(fact)
                }
                
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animal: [Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        InsetFactView(animal: animal[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
