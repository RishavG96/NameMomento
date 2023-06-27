//
//  User.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import Foundation
import SwiftUI
import CoreLocation

struct User: Identifiable, Codable, Comparable, Equatable {
    var id = UUID()
    var name: String = ""
    var image: Data = Data()
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    var getImage: UIImage {
        return UIImage(data: image, scale:1.0) ?? UIImage()
    }
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }
}
