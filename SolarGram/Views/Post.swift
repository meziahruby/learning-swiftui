//
//  Post.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Post: View {
    
    @State var isLiked = false
    
    var post: FeedModel
    
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
                
                // Caption and Like button
                VStack(alignment: .leading, spacing: 0) {
                    Text(post.caption)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading) // Fill up space for short captions
                    Button(action: { isLiked.toggle()
                    }, label: {
                        switch isLiked {
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

                }
                .padding(10)

                Divider()
            }
    }
}

struct Post_Previews: PreviewProvider {
    static var previews: some View {
        Post(post: solarGramFeed[0])
    }
}
