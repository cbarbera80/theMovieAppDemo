//
//  Actor.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation

public struct Actor: Decodable {
    public let name: String
    public let profilePath: String?
    public let character: String
}

public struct Crew: Decodable {
    public let name: String
    public let profilePath: String?
    public let job: String
}
