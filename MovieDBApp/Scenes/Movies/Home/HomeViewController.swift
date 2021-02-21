//
//  HomeViewController.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MovieDBAppModels

protocol HomeViewControllerDelegate: class {
    func didSelectMovie(_ movie: Movie)
}

class HomeViewController: UIViewController {
    
    // MARK: - UI properties

    var aview: HomeView? {
        return view as? HomeView
    }

    // MARK: - Business properties
    weak var delegate: HomeViewControllerDelegate?
    private let viewModel: HomeViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Object lifecycle

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle

    override func loadView() {
        view = HomeView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
        viewModel.fetchData()
    }
    
    // MARK: - Configure methods

    private func configureUI() {
        title = L10n.Home.title
        aview?.collectionView.register(MovieCollectionViewCell.self)
    }
    
    private func bind() {
        guard let aView = aview else { return }
        
        viewModel
            .moviesRelay
            .bind(to: aView.collectionView.rx.items(cellIdentifier: MovieCollectionViewCell.defaultReuseIdentifier, cellType: MovieCollectionViewCell.self)) { _, movie, cell in
                cell.configureCell(withViewModel: MovieViewModel(movie: movie))
            }
            .disposed(by: disposeBag)
        
        aView.collectionView.rx
            .itemSelected
            .subscribe(onNext: { [weak self] index in self?.handleSelection(at: index) })
            .disposed(by: disposeBag)
        
        aView
            .collectionView
            .rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] _, indexPath in self?.manageInfiniteScrolling(currentIndexPath: indexPath) })
            .disposed(by: disposeBag)
        
        aView
            .collectionView
            .rx
            .didEndDisplayingCell
            .subscribe(onNext: { cell, _ in
                if let cell = cell as? MovieCollectionViewCell {
                    cell.cancelDownload()
                }
                
            })
            .disposed(by: disposeBag)
        
        viewModel
            .statusRelay
            .asObservable()
            .subscribe { [weak self] status in self?.aview?.status = status }
            .disposed(by: disposeBag)
    }
    
    private func manageInfiniteScrolling(currentIndexPath: IndexPath) {
        
        if currentIndexPath.row == viewModel.moviesRelay.value.count - Constants.infiniteScrollingOffset {
            viewModel.fetchData()
        }
    }
    
    // MARK: - User interactions
    @objc
    private func handleSelection(at index: IndexPath) {
        let movie = viewModel.moviesRelay.value[index.row]
        delegate?.didSelectMovie(movie)
    }
    
    // MARK: - Private methods

}
