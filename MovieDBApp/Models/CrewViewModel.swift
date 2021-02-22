//
//  CrewViewModel.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 22/02/21.
//

import Foundation
import MovieDBAppModels

struct CrewViewModel: PeopleCarouselRepresentable {
   
    var subtitle: String {
        return crew.job
    }
    
    var title: String {
        return crew.name
    }
    
    var url: URL? {
        return ImageType.original(path: crew.profilePath).fullString
    }
    
    private let crew: Crew
    
    init?(crew: Crew) {
        guard crew.profilePath != nil else { return nil }
        self.crew = crew
    }

}
