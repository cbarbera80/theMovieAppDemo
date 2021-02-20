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
}
