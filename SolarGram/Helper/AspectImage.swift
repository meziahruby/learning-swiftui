//
//  AspectImage.swift
//  SolarGram
//
//  Created by Douglas Hewitt on 2/27/23.
//
import SwiftUI

/// Aspect image
/// Default is a ratio of 1:1 for a square image
struct AspectImage: View {
    
    var image: Image
    var aspect: CGFloat = 1.0
    
    init(_ image: Image) {
        self.image = image
    }
    
    var body: some View {
        Rectangle()
            .aspectRatio(aspect, contentMode: .fit)
            .overlay {
                image
                    .resizable()
                    .scaledToFill()
            }
            .clipped()
    }
}

struct AspectImage_Previews: PreviewProvider {
    static var previews: some View {
        AspectImage(Image("joe"))
    }
}
