//
//  FeedModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import Foundation
import SwiftUI

struct FeedsModel: Identifiable, Hashable, Codable {
    var id: UUID = UUID()
    
    var user: String
    var profilePic: Image { Image(user) }
    
    var imageName: String
    var image: Image { Image(imageName) }
    var caption: String
}
