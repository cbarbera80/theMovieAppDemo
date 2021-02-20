//
//  PaginatedResponse.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

public struct PaginatedResponse<T: Decodable>: Decodable {
    public let page: Int
    public let results: [T]
    public let totalPages: Int
    public let totalResults: Int
}
