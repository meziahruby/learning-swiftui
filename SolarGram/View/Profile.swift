//
//  Profile.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Profile: View {
    
    @EnvironmentObject var viewModel: FeedViewModel
    
    // I learned this trick for defining flexible grids from AppCoda - https://www.appcoda.com/learnswiftui/swiftui-gridlayout.html
    private var threeColGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let loggedInUser = "Howl" // Spoofing this because we are not doing authentication
    var filteredPosts: [PostModel] { viewModel.feed.filter { $0.user == loggedInUser } }

    
    var body: some View {
        
        VStack {
            // User
            Image("Howl")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text("Howl").font(.title)
            
            // User's Grid
            LazyVGrid(columns: threeColGrid, spacing: 10) {
                ForEach(filteredPosts) { post in
                    AspectImage(post.image) // Using AspectImage from Prof Douglas
                }
            }
            Spacer()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile().environmentObject(FeedViewModel())
    }
}
