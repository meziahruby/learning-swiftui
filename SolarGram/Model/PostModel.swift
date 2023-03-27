//
//  PostModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/25/23.
//

import Foundation
import SwiftUI

struct SolarGramPosts {
    /*
     Simplied SolarGram to read only from this array instead of loading from json
     Doing this way, I can use Image directly, so I can use the Image/Camera Pickers
     */
    var posts: [PostModel] = [
        PostModel(user: "Sophie", image: Image("marcoEating"), caption: "Little wizard, big appetite!", isLiked: false, canBeDeleted: false),
        PostModel(user: "Howl", image: Image("starryGarden"), caption: "#TBT miss this place", isLiked: false, canBeDeleted: false),
        PostModel(user: "Howl", image: Image("calcifer"), caption: "Calcifer hard at work keeping the castle moving", isLiked: false, canBeDeleted: false),
        PostModel(user: "Howl", image: Image("sophieAtMarket"), caption: "Shopping with Sophie today! She's so good at getting bargains.", isLiked: false, canBeDeleted: false),
        PostModel(user: "Sophie", image: Image("viewFromBalcony"), caption: "Howl and Calcifer are a handful, but Markl is cute  and this view is unbeatable. Guess I'll make the best of this place.", isLiked: false, canBeDeleted: false),
        PostModel(user: "Howl", image: Image("castle"), caption: "Ahh, can't beat this view at sunrise!", isLiked: false, canBeDeleted: false)
    ]
    
    // Referenced MVVM Refactor lecture
    // Find item at index and toggle the isLiked bool
    mutating func likePost(_ post: PostModel) {
        let postIndex = posts.firstIndex { p in
            p.id == post.id
        }
        guard let actualIndex = postIndex else {return}
        
        posts[actualIndex].isLiked.toggle()
    }
    
    // Add logic = append to end of array
    mutating func add(_ post: PostModel) {
        /*
         I know append was the suggested way but it seemed nicer/more correct
         to have the newest post show up at top so I went for an insert instead
        */
        // self.posts.append(post)
        self.posts.insert(post, at: 0)
    }
    
    // Created with reference to likePost/MVVM Refactor lecture
    // Find item at index and remove
    mutating func delete(_ post: PostModel) {
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
    
    var image: Image
    var caption: String
    
    var isLiked: Bool
    var canBeDeleted: Bool
}
