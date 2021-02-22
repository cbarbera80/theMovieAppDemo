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
    let credits: Credit?
    
    init(movie: Movie, credits: Credit? = nil) {
        self.movie = movie
        self.credits = credits
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
    
    var overviewText: String? {
        return movie.overview
    }
    
    var genresText: String? {
        return movie.genres?.map { $0.name }.joined(separator: ", ")
    }
    
    var yearText: String? {
        return movie.releaseDate?.toString(format: .year)
    }
    
    var durationText: String? {
        guard let duration = movie.runtime else { return nil }
        let durationInSeconds = duration * 60
        return durationInSeconds.toString(format: .duration)
    }
    
    var castViewModels: [ActorViewModel]? {
        return credits?.cast.compactMap { ActorViewModel(actor: $0) }
    }
    
    var crewViewModels: [CrewViewModel]? {
        return credits?.crew.compactMap { CrewViewModel(crew: $0) }
    }
}
