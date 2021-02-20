//
//  Coordinator.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation

protocol Coordinator: class {
    func start()
    var coordinators: [Coordinator] { get set }
}
