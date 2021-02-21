//
//  DetailViewController.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol DetailViewControllerDelegate: class { }

class DetailViewController: UIViewController {
    
    // MARK: - UI properties

    var aview: DetailView? {
        return view as? DetailView
    }

    // MARK: - Business properties
    weak var delegate: DetailViewControllerDelegate?
    private let viewModel: MovieViewModel
    private let disposeBag = DisposeBag()
    
    // MARK: - Object lifecycle

    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle

    override func loadView() {
        view = DetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bind()
    }
    
    // MARK: - Configure methods

    private func configureUI() {
        title = viewModel.titleText
    }
    
    private func bind() {
        guard let aView = aview else { return }
    }
    // MARK: - User interactions
    
    // MARK: - Private methods

}
