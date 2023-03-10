//
//  FeedModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import Foundation
import SwiftUI

struct FeedModel: Identifiable, Hashable, Codable {
    var id: Int
    
    var user: String
    private var profilePicName: String
    var profilePic: Image { Image(profilePicName) }
    
    private var imageName: String
    var image: Image { Image(imageName) }
    var caption: String
}
