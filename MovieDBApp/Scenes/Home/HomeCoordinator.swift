//
//  HomeCoordinator.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {

    // MARK: - Enums
    enum HomeStep {
        case home
    }
    
    // MARK: - Architecture properties
    private let homeViewController: HomeViewController
    private let window: UIWindow
    private let navigator: UINavigationController
    var coordinators: [Coordinator] = []
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        homeViewController = HomeViewController(viewModel: .init())
        navigator = UINavigationController(rootViewController: homeViewController)
    }
    
    // MARK: - Coordinator
    func start() {
        goTo(step: .home)
    }
    
    // MARK: - Private func
    private func goTo(step: HomeStep) {
        switch step {
        case .home:
            window.rootViewController = navigator
        }
    }
}
