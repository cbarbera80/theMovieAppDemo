//
//  API+MovieServices.swift
//  MovieDBAppServices
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation
import MovieDBAppModels

extension APIServices: MovieServices {
   
    public func getMovie(with request: MovieRequestDTO, completionHandler: @escaping (Result<Movie, MovieDBError>) -> Void) {
       
        provider.request(.getMovie(request: request)) { result in
            
            switch result {
            case .success(let response):
                if let movie = try? response.map(Movie.self, using: APIServices.decoder) {
                    completionHandler(.success(movie))
                } else {
                    completionHandler(.failure(.invalidMapping))
                }
                
            case .failure(let error):
                completionHandler(.failure(.networkError(error: error)))
            }
        }
    }
    
    public func getPopulars(with request: PopularRequestDTO, completionHandler: @escaping (Result<[Movie], MovieDBError>) -> Void) {
        
        provider.request(.getPopoulars(request: request)) { result in
            
            switch result {
            case .success(let response):
                if let wrappedMovies = try? response.map(PaginatedResponse<Movie>.self, using: APIServices.decoder) {
                    completionHandler(.success(wrappedMovies.results))
                } else {
                    completionHandler(.failure(.invalidMapping))
                }
                
            case .failure(let error):
                completionHandler(.failure(.networkError(error: error)))
            }
        }
    }
    
    public func getCredits(with request: CreditsRequestDTO, completionHandler: @escaping (Result<Credit, MovieDBError>) -> Void) {
        
        provider.request(.getCredits(request: request)) { result in
            
            switch result {
            case .success(let response):
                if let credits = try? response.map(Credit.self, using: APIServices.decoder) {
                    completionHandler(.success(credits))
                } else {
                    completionHandler(.failure(.invalidMapping))
                }
                
            case .failure(let error):
                completionHandler(.failure(.networkError(error: error)))
            }
        }
    }
}
