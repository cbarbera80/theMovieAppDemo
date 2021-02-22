//
//  DetailViewModel.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Foundation
import MovieDBAppModels
import MovieDBAppServices
import RxSwift
import RxCocoa
import PromiseKit

enum DetailViewStatus {
    case idle
    case loading
    case loaded(viewModel: MovieViewModel)
    case error(error: Error)
}

class DetailViewModel {

    // MARK: - Business properties
    private let services: MovieServices
    private let language: String?
    private let id: Int
    
    var statusRelay = BehaviorRelay<DetailViewStatus>(value: .idle)
    
    // MARK: - Init
    init(services: MovieServices, id: Int, language: String? = Locale.current.languageCode) {
        self.services = services
        self.language = language
        self.id = id
    }
    
    // MARK: -
    func fetchData() {
       
        statusRelay.accept(.loading)
        
        when(fulfilled: getMovie(), getCredits())
            .done { movie, credits in
                self.statusRelay.accept(.loaded(viewModel: MovieViewModel(movie: movie, credits: credits)))
            }.catch { error in
                self.statusRelay.accept(.error(error: error))
            }
    }
    
    private func getMovie() -> Promise<Movie> {
        return Promise { seal in
            services.getMovie(with: .init(id: id, language: language)) { result in
                switch result {
                case .success(let movie):
                    seal.fulfill(movie)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
    
    private func getCredits() -> Promise<Credit> {
        return Promise { seal in
            services.getCredits(with: .init(id: id, language: language)) { result in
                switch result {
                case .success(let credits):
                    seal.fulfill(credits)
                case .failure(let error):
                    seal.reject(error)
                }
            }
        }
    }
}
