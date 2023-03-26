//
//  FeedViewModel.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/25/23.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    @Published private var model: SolarGramPosts = SolarGramPosts()

    var feed: [PostModel] {
        model.posts
    }
    
    func addPostFrom(image: UIImage?) {

        // make sure the optional is an actual image
        guard let image else {return}
        
        let id = 2
        
        // you must do this on main thread for UI to update properly
        DispatchQueue.main.async {
            // create a new post object, it might look like this, but you can adapt as needed in your project.
            let newPost = PostModel(id: id+1, user: "howl", imageName: image.description, caption: "Something New")

            // call some function on the model to add the new post to the array of posts, you can do this how you like, but the logic should be in the model
            self.model.add(post: newPost)
            
            print(self.feed)
        }
 
    }
    
}
