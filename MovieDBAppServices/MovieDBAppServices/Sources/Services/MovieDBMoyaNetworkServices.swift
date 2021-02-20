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
            return .requestJSONEncodable(request)
        }
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/vnd.github.v3+json"]
    }
}
