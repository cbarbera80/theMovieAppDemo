//
//  CreditsRequestDTO.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation

public struct CreditsRequestDTO: Encodable {
    
    public let id: Int
    public let language: String?
    
    public init(id: Int, language: String?) {
        self.id = id
        self.language = language
    }
    
    public var parameters: [String: Any] {
        
        var params: [String: Any] = [:]
            
        if let language = language {
            params["language"] = language
        }
        
        return params
    }
}