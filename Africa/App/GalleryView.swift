//
//  GalleryView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI

struct GalleryView: View {
    //MARK: - Properties
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    //MARK: - Grid Defination
    //    let gridLayout: [GridItem] = [
    //        GridItem(.flexible()),
    //        GridItem(.flexible()),
    //        GridItem(.flexible())
    //    ]
    
    //MARK: - Efficient Grid Defination
//    let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
    
    //MARK: - body
    var body: some View {
        VStack {
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(12)
//                    .clipShape(Circle())
//                    .overlay(Circle().stroke(Color.white,lineWidth: 1))
            
            Slider(value: $gridColumn,in:2...4,step:1)
                .padding()
                .onChange(of: gridColumn, perform: { value in
                    gridSwitch()
                })
            
            Spacer(minLength: 30)
            ScrollView(.vertical,showsIndicators:false) {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    
                    ForEach(animals){ item in
                        let images: [String] = item.gallery
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                        ForEach(0..<images.count){ index in
                            Image(images[index])
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white,lineWidth: 1))
                                .onTapGesture {
                                    selectedAnimal = images[index]
                                }
                        }
                    }
                    .animation(.easeIn)
                    .onAppear(perform: {
                        gridSwitch()
                    })
                })
            }

        }.background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}


//            ForEach(animals){ item in
//                let images: [String] = item.gallery
//                    Image(item.image)
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width:80,height:80)
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.white,lineWidth: 1))
//                Spacer(minLength: 20)
//                VStack {
//                    LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
//                        ForEach(0..<images.count){ index in
//                            Image(images[index])
//                                .resizable()
//                                .scaledToFit()
//                                .clipShape(Circle())
//                                .overlay(Circle().stroke(Color.white,lineWidth: 1))
//                        }
//                    })
//                }
//                Divider()
//                Spacer(minLength: 30)
//
//            }
