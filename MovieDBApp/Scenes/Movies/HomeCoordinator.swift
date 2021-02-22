//
//  HomeCoordinator.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import MovieDBAppModels
import MovieDBAppServices

class HomeCoordinator: Coordinator {

    // MARK: - Enums
    enum HomeStep {
        case home
        case details(movie: Movie)
    }
    
    // MARK: - Architecture properties
    private let homeViewController: HomeViewController
    private let window: UIWindow
    private let navigator: UINavigationController
    private let services: MovieServices
    var coordinators: [Coordinator] = []
    
    // MARK: - Init
    init(window: UIWindow, services: MovieServices) {
        self.window = window
        self.services = services
        homeViewController = HomeViewController(viewModel: .init(services: services))
        navigator = UINavigationController(rootViewController: homeViewController)
        navigator.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Coordinator
    func start() {
        goTo(step: .home)
    }
    
    // MARK: - Private func
    private func goTo(step: HomeStep) {
        switch step {
        case .home:
            homeViewController.delegate = self
            window.rootViewController = navigator
        case .details(let movie):
            let detailsViewController = DetailViewController(viewModel: .init(services: services, id: movie.id), title: movie.title)
            navigator.pushViewController(detailsViewController, animated: true)
        }
    }
}

extension HomeCoordinator: HomeViewControllerDelegate {
    func didSelectMovie(_ movie: Movie) {
        goTo(step: .details(movie: movie))
    }
}
