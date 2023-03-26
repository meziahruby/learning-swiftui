//
//  PostModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/25/23.
//

import SwiftUI

struct SolarGramPosts {
    var posts: [PostModel] = [PostModel(id: 0, user: "Howl", imageName: "sophieAtMarket", caption: "Shopping with Sophie today! She's so good at getting bargains."),
                        PostModel(id: 1, user: "Sophie", imageName: "viewFromBalcony", caption: "Howl and Calcifer are a handful, but Markl is cute and this view is unbeatable. Guess I'll make the best of this place."),
                        PostModel(id: 2, user: "Howl", imageName: "castle", caption: "Ahh, can't beat this view at sunrise!")]
    
    mutating func add(post: PostModel) {
        self.posts.append(post)
    }
}

struct PostModel: Identifiable, Decodable {
    var id: Int?
    
    var user: String
    var profilePic: Image { Image(user) }
    
    var imageName: String
    var image: Image { Image(imageName) }
    var caption: String
}
