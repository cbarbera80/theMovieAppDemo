//
//  ActorViewModel.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation
import MovieDBAppModels

struct ActorViewModel: PeopleCarouselRepresentable {
 
    var title: String {
        return actor.name
    }
    
    var subtitle: String {
        return actor.character
    }
    
    var url: URL? {
        return ImageType.original(path: actor.profilePath).fullString
    }
    
    private let actor: Actor
    
    init?(actor: Actor) {
        guard actor.profilePath != nil else { return nil }
        self.actor = actor
    }

}
