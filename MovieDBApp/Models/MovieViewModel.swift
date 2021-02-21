//
//  MovieViewModel.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Foundation
import MovieDBAppModels

struct MovieViewModel {
    
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
    
    var titleText: String {
        return movie.title
    }
    
    var backdropW500PictureURL: URL? {
        return ImageType.w500(path: movie.backdropPath).fullString
    }
    
    var backdropOriginalPictureURL: URL? {
        return ImageType.original(path: movie.backdropPath).fullString
    }
    
    var posterW500PictureURL: URL? {
        return ImageType.w500(path: movie.posterPath).fullString
    }
    
    var posterOriginalPictureURL: URL? {
        return ImageType.original(path: movie.posterPath).fullString
    }
}
