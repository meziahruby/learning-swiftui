//
//  Feed.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Feed: View {
    @State private var showImagePicker = false
    @State private var showFilePicker = false
    
    var viewModel: FeedViewModel
    
    var body: some View {

        // Upload post menu
        HStack {
            Spacer()
            Button(action: { showImagePicker = true
            }, label: {
                    Image(systemName: "photo.on.rectangle.angled")
                    .scaleEffect(1.3)
                        .padding(.all, 10)
            })
            .buttonStyle(.plain)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(viewModel: FeedViewModel())
            }
            Button(action: { showFilePicker = true
            }, label: {
                    Image(systemName: "camera")
                        .scaleEffect(1.3)
                        .padding(.trailing, 15)
            })
            .buttonStyle(.plain)
            .sheet(isPresented: $showFilePicker) {
                CameraPicker(viewModel: FeedViewModel())
            }
        }
        Divider()
        
        // Uploaded posts
        VStack {
            ForEach(viewModel.feed) { post in
                Post(post: post)
            }
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            Feed(viewModel: FeedViewModel())
        }
    }
}
