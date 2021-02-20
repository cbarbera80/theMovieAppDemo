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
    }
    
    // MARK: - Configure methods

    private func configureUI() {
        
    }
    
    private func bind() {
        guard let aView = aview else { return }
    }
    // MARK: - User interactions
    
    // MARK: - Private methods

}
