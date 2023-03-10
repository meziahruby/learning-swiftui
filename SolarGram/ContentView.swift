//
//  ContentView.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        /*
         * Much easier to use TabView over NavigationView + ToolbarItemGroup
         * NavigationView is also being deprecated in favor of NavigationStack
         */
        TabView {
            ScrollView { Feed() }
                .tabItem {
                    Label("Photos", systemImage: "photo.stack")
                }
            
            Profile()
                .tabItem {
                    Label("Profile", systemImage: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
