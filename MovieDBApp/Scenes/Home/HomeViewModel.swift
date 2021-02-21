//
//  HomeViewModel.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import MovieDBAppModels
import MovieDBAppServices
import RxSwift
import RxCocoa

enum HomeViewStatus {
    case idle
    case loading
}

class HomeViewModel {

    // MARK: - Business properties
    private let services: MovieServices
    private let language: String?
    var currentPage = 0
    
    let moviesRelay = BehaviorRelay<[Movie]>(value: [])
    var statusRelay = BehaviorRelay<HomeViewStatus>(value: .idle)
    
    // MARK: - Init
    init(services: MovieServices, language: String? = Locale.current.languageCode) {
        self.services = services
        self.language = language
    }
    
    // MARK: -
    func fetchData() {
        currentPage += 1
        statusRelay.accept(.loading)
        
        services.getPopulars(with: .init(page: currentPage, language: language)) { [weak self] result in
            
            self?.statusRelay.accept(.idle)
            
            switch result {
            case .success(let movies):
                var currentMovies = self?.moviesRelay.value ?? []
                currentMovies += movies
                self?.moviesRelay.accept(currentMovies)
            case .failure(let error):
                print(error)
            }
        }
    }
}
