//
//  PhotoModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import Foundation
import SwiftUI

struct PhotoModel: Identifiable, Hashable, Codable {
    var id: Int
    var caption: String
    
    private var imageName: String
    var image: Image { Image(imageName) }
}
