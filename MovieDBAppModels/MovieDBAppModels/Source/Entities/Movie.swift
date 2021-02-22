//
//  Movie.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

public struct Movie: Decodable {
    
    public let id: Int
    public let overview: String
    public let title: String
    public let voteAverage: Double
    public let voteCount: Int
    public let backdropPath: String?
    public let posterPath: String?
    public let genres: [Genre]?
    public let releaseDate: Date?
    public let runtime: Double?
}
