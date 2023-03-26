//
//  ModelData.swift
//  SolarGram
//
//  Created by Meziah Cristobal on 3/4/23.
//

import Foundation

var howlFeed: [PhotoModel] = load("howlPhotos.json")
var solarGramFeed: [PostModel] = load("feedData.json")


// Copied from previous HW tutorial
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
