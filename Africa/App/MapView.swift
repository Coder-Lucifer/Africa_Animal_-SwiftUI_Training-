//
//  MapView.swift
//  Africa
//
//  Created by Aviral on 22/04/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoom = MKCoordinateSpan(latitudeDelta: 80.0, longitudeDelta: 80.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoom)
        return mapRegion
    }()
    
    let locations: [LocationModel] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: {item in
            //            MapPin(coordinate: item.location, tint: .accentColor)
            //            MapAnnotation(coordinate: item.location) {
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32, height: 32, alignment: .center)
            //            }
            MapAnnotation(coordinate: item.location) {
                CustomAnnotationView(location: item)
            }
        }).overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3, content: {
                    HStack{
                        Text("Lattitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Divider()
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                })
            }
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            ,alignment: .top
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
