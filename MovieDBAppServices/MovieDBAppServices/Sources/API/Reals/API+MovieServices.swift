//
//  API+MovieServices.swift
//  MovieDBAppServices
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation
import MovieDBAppModels

extension APIServices: MovieServices {
    
    public func getPopulars(with request: PopularRequestDTO, completionHandler: @escaping (Result<[Movie], MovieDBError>) -> Void) {
        
        provider.request(.getPopoulars(request: request)) { result in
            
            switch result {
            case .success(let response):
                let wrappedMovies = try? response.map(PaginatedResponse<Movie>.self, using: APIServices.decoder)
                completionHandler(.success(wrappedMovies?.results ?? []))
            case .failure(let error):
                completionHandler(.failure(.networkError(error: error)))
            }
        }
    }
}
