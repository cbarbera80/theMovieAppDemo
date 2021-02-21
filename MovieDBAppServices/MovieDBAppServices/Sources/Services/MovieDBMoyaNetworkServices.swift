//
//  MovieDBMoyaNetworkServices.swift
//  MovieDBAppServices
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation
import Moya
import MovieDBAppModels

enum MovieDBMoyaNetworkServices {
    case getPopoulars(request: PopularRequestDTO)
}

extension MovieDBMoyaNetworkServices: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/")!
    }
    
    var path: String {
        switch self {
        
        case .getPopoulars:
            return "movie/popular"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPopoulars:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getPopoulars(let request):
            return .requestParameters(parameters: request.parameters, encoding: URLEncoding.default)
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    // swiftlint:disable line_length
    var headers: [String: String]? {
        return ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZTVhNTI4MzRkZjY5ZGVkNGYyYjZjODMyZDc2Mzg4ZCIsInN1YiI6IjYwMzBkY2JiMjBlY2FmMDAzZDE1NWI3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJ6VdSoq_L6m58VU1oYho-qZalYihRm_0uUbZWaacds"]
    }
    // swiftlint:enable line_length
}
