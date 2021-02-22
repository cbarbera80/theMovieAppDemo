//
//  Credit.swift
//  MovieDBAppModels
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation

public struct Credit: Decodable {
    public let id: Int
    public let cast: [Actor]
    public let crew: [Crew]
}
