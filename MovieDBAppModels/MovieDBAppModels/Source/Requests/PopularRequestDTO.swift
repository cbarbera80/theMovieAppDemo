//
//  PopularRequestDTO.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

public struct PopularRequestDTO: Encodable {
    
    public let page: Int
    public let language: String?
    
    public init(page: Int, language: String?) {
        self.page = page
        self.language = language
    }
    
    public var parameters: [String: Any] {
        
        var params: [String: Any] = ["page": page]
            
        if let language = language {
            params["language"] = language
        }
        
        return params
    }
}
