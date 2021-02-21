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

protocol HomeViewControllerDelegate: class { }

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
        aview?.tableView.register(MovieTableViewCell.self)
    }
    
    private func bind() {
        guard let aView = aview else { return }
        
        viewModel
            .moviesRelay
            .bind(to: aView.tableView.rx.items(cellIdentifier: MovieTableViewCell.defaultReuseIdentifier, cellType: MovieTableViewCell.self)) { _, movie, cell in
                cell.configureCell(withViewModel: MovieViewModel(movie: movie))
            }
            .disposed(by: disposeBag)
        
        aView
            .tableView
            .rx
            .willDisplayCell
            .subscribe(onNext: { [weak self] _, indexPath in self?.manageInfiniteScrolling(currentIndexPath: indexPath) })
            .disposed(by: disposeBag)
        
        aView
            .tableView
            .rx
            .didEndDisplayingCell
            .subscribe(onNext: { [weak self] cell, indexPath in
                if let cell = cell as? MovieTableViewCell {
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
        
        if currentIndexPath.row == viewModel.moviesRelay.value.count - 5 {
            viewModel.fetchData()
        }
    }
    
    // MARK: - User interactions
    
    // MARK: - Private methods

}
