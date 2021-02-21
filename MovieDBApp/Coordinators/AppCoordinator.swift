//
//  AppCoordinator.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//

import UIKit
import MovieDBAppServices

class AppCoordinator: Coordinator {
    
    private let window: UIWindow
    private let services: MovieServices
    var coordinators: [Coordinator] = []
    
    init(withWindow window: UIWindow, services: MovieServices) {
        self.window = window
        self.services = services
    }
    
    func start() {
        coordinators.removeAll { $0 is HomeCoordinator }
        
        let homeCoordinator = HomeCoordinator(window: window, services: services)
        homeCoordinator.start()
        coordinators.append(homeCoordinator)
    }
}
