//
//  ImageType.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Foundation

enum ImageType {
    case original(path: String?)
    case w500(path: String?)
    
    var fullString: URL? {
        switch self {
        case .original(let path):
            guard let path = path else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/original/\(path)")
        case .w500(let path):
            guard let path = path else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/w500/\(path)")
        }
    }
}
