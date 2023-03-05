//
//  Feed.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Feed: View {
    
    var body: some View {
        VStack {
            ForEach(solarGramFeed) { post in
                Post(post: post)
            }
        }
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            Feed()
        }
    }
}
