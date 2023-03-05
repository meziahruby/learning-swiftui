//
//  Profile.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Profile: View {
    // I learned this trick for defining flexible grids from AppCoda - https://www.appcoda.com/learnswiftui/swiftui-gridlayout.html
    private var threeColGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        
        VStack {
            // User
            Image("howl")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
            Text("Howl").font(.title)
            
            // User's Grid
            LazyVGrid(columns: threeColGrid, spacing: 10) {
                ForEach(howlFeed) { photo in
                    Photo(photo: photo)
                        .photo
                        .image
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .aspectRatio(1, contentMode: .fill)
                        .clipped()
                }
            }
            Spacer()
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
