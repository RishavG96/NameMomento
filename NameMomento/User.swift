//
//  User.swift
//  NameMomento
//
//  Created by Rishav Gupta on 26/06/23.
//

import Foundation
import SwiftUI

struct User: Identifiable, Codable, Comparable {
    var id = UUID()
    var name: String = ""
    var image: Data = Data()

    var getImage: UIImage {
        return UIImage(data: image, scale:1.0) ?? UIImage()
    }
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.name < rhs.name
    }
}
