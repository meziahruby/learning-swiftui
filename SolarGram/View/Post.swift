//
//  Post.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Post: View {
    
    @EnvironmentObject var viewModel: FeedViewModel
    var post: PostModel
    
    var body: some View {
        
            VStack {
                // User
                HStack {
                    post.profilePic
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .aspectRatio(1, contentMode: .fill)
                        .clipShape(Circle())
                    Text(post.user)
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                .padding(.leading, 10)
                
                // Image
                AspectImage(post.image)
                /*
                    // This helps clip the image to squares
                    // Learned from https://stackoverflow.com/questions/58290963/clip-image-to-square-in-swiftui
                    ZStack {
                        post.image
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .clipped()
                    .aspectRatio(1, contentMode: .fill)
                 */
                
                // Caption and Post Action Buttons
                VStack(alignment: .leading, spacing: 0) {
                    Text(post.caption)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // Fill up space for short captions
                    
                    HStack {
                        // Like button
                        Button(action: { viewModel.likePost(post)},
                            label: {
                                switch post.isLiked {
                                case true:
                                    Image(systemName: "heart.fill")
                                        .scaleEffect(1.5)
                                        .padding(.top, 10)
                                default:
                                    Image(systemName: "heart")
                                        .scaleEffect(1.5)
                                        .padding(.top, 10)
                                }
                            })
                            .buttonStyle(.plain)
                        
                        // Delete button - Only show up if it can be deleted
                        Button(action: { viewModel.deletePost(post)},
                            label: {
                                Image(systemName: "trash")
                                    .scaleEffect(1.5)
                                    .padding(.top, 10)
                            })
                            .buttonStyle(.plain)
                            // This opacity trick taken from https://stackoverflow.com/questions/57420386/how-do-you-make-a-button-conditionally-hidden-or-disabled
                            .opacity(post.canBeDeleted ? 1 : 0)
                            
                    }

                }
                .padding(10)

                Divider()
            }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        let postPreviewObject = PostModel(user: "Howl", image: Image("sophieAtMarket"), caption: "Shopping with Sophie today!", isLiked: false, canBeDeleted: false)
        Post(post: postPreviewObject)
    }
}
