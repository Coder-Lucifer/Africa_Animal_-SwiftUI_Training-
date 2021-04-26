//
//  LocationModel.swift
//  Africa
//
//  Created by Aviral on 23/04/21.
//

import SwiftUI
import MapKit

struct LocationModel: Identifiable,Codable {
    var id : String
    var name : String
    var image : String
    var latitude : Double
    var longitude : Double
    
    //MARK: - Computed Properties
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
