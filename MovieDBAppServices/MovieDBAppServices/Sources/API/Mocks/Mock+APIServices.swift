//
//  Mock+APIServices.swift
//  MovieDBAppServices
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation
import MovieDBAppModels

extension MockAPIServices: MovieServices {
   
    public func getMovie(with request: MovieRequestDTO, completionHandler: @escaping (Result<Movie, MovieDBError>) -> Void) {
       
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let mock = JSONMapOperation<Movie>()
            let movie = mock.decode(from: "movie")!
            completionHandler(.success(movie))
        }
        
    }
    
    public func getPopulars(with request: PopularRequestDTO, completionHandler: @escaping (Result<[Movie], MovieDBError>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let mock = JSONMapOperation<PaginatedResponse<Movie>>()
            let movies = mock.decode(from: "populars")!
            completionHandler(.success(movies.results))
        }
        
    }
    
    public func getCredits(with request: CreditsRequestDTO, completionHandler: @escaping (Result<Credit, MovieDBError>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            let mock = JSONMapOperation<Credit>()
            let credits = mock.decode(from: "credits")!
            completionHandler(.success(credits))
        }
    }
}
