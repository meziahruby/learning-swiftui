//
//  PostModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/25/23.
//

import SwiftUI

struct SolarGramPosts {
    var posts: [PostModel] = [PostModel(user: "Howl", imageName: "sophieAtMarket", caption: "Shopping with Sophie today! She's so good at getting bargains.", isLiked: false, canBeDeleted: false),
                              PostModel(user: "Sophie", imageName: "viewFromBalcony", caption: "Howl and Calcifer are a handful, but Markl is cute  and this view is unbeatable. Guess I'll make the best of this place.", isLiked: false, canBeDeleted: false),
                              PostModel(user: "Howl", imageName: "castle", caption: "Ahh, can't beat this view at sunrise!", isLiked: false, canBeDeleted: false)]
    
    // Referenced MVVM Refactor lecture
    // Find item at index and toggle the isLiked bool
    mutating func likePost(post: PostModel) {
        let postIndex = posts.firstIndex { p in
            p.id == post.id
        }
        guard let actualIndex = postIndex else {return}
        
        posts[actualIndex].isLiked.toggle()
    }
    
    // Add logic = append to end of array
    mutating func add(post: PostModel) {
        self.posts.append(post)
    }
    
    // Created with reference to likePost/MVVM Refactor lecture
    // Find item at index and remove
    mutating func delete(post: PostModel) {
        let postIndex = posts.firstIndex { p in
            p.id == post.id
        }
        guard let actualIndex = postIndex else {return}
        posts.remove(at: actualIndex)
    }
}

struct PostModel: Identifiable {
    var id: UUID = UUID()
    
    var user: String
    var profilePic: Image { Image(user) }
    
    var imageName: String
    var imageFromName: Image { Image(imageName) }
    var image: Image?
    var caption: String
    
    var isLiked: Bool
    var canBeDeleted: Bool
}
