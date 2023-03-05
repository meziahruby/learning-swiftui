//
//  Photo.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import SwiftUI

struct Photo: View {
    var photo: PhotoModel
    
    var body: some View {
        
        ZStack {
            VStack {
                photo.image
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct Photo_Previews: PreviewProvider {
    static var previews: some View {
        Photo(photo: howlFeed[0])
    }
}

