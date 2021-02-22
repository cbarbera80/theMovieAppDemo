//
//  PeopleCarouselRepresentable.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation
import MovieDBAppModels

protocol PeopleCarouselRepresentable {
    var url: URL? { get }
    var title: String { get }
    var subtitle: String { get }
}
