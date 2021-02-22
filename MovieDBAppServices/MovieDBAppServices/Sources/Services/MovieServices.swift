//
//  MovieServices.swift
//  MovieDBAppServices
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation
import MovieDBAppModels

public protocol MovieServices {
    
    func getPopulars(with request: PopularRequestDTO, completionHandler: @escaping (Result<[Movie], MovieDBError>) -> Void)
    func getMovie(with request: MovieRequestDTO, completionHandler: @escaping (Result<Movie, MovieDBError>) -> Void)
    func getCredits(with request: CreditsRequestDTO, completionHandler: @escaping (Result<Credit, MovieDBError>) -> Void)
}
