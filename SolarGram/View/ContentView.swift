//
//  ContentView.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel: FeedViewModel
    
    @State var showModal = false
    
    var body: some View {
        /*
         * Much easier to use TabView over NavigationView + ToolbarItemGroup
         * NavigationView is also being deprecated in favor of NavigationStack
         */
        TabView {
            ScrollView { Feed(viewModel: FeedViewModel()) }
                .tabItem {
                    Label("Feed", systemImage: "shared.with.you")
                }
            
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
            CameraPicker(viewModel: FeedViewModel())
                .tabItem {
                    Label("Take Photo", systemImage: "camera")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(viewModel: FeedViewModel())
    }
}
