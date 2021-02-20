//
//  NetworkError.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

public enum MovieDBError: Error {
    case networkError(error: Error)
}
