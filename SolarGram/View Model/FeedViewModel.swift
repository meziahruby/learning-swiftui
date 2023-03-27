//
//  FeedViewModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/25/23.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    // Connect to the model
    @Published private var model: SolarGramPosts = SolarGramPosts()

    // This makes it available to Views since model is private
    var feed: [PostModel] {
        model.posts
    }
    
    func likePost(_ post: PostModel) {
        model.likePost(post)
    }
    
    // Adds posts - From Prof Douglas
    func addPostFrom(image: UIImage?) {

        // make sure the optional is an actual image
        guard let image else {return}
        
        // you must do this on main thread for UI to update properly
        DispatchQueue.main.async {
            // create a new post object, it might look like this, but you can adapt as needed in your project.
            

            let newPost = PostModel(user: "Howl", image: Image(uiImage: image), caption: "Something New", isLiked:  false, canBeDeleted: true)

            // call some function on the model to add the new post to the array of posts, you can do this how you like, but the logic should be in the model
            self.model.add(newPost)
        }
    }
    
    func deletePost(_ post: PostModel) {
        model.delete(post)
    }
    
}
