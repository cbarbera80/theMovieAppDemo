//
//  HomeView.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Anchorage

class HomeView: UIView {
    
    // MARK: - Properties
    var status: HomeViewStatus {
        didSet {
            refreshStatus()
        }
    }
    
    // MARK: - UI properties
    lazy var tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        return view
    }()
    
    var loadingView: UIView = {
        let view = UIView()
        view.backgroundColor = Asset.backgroundColor.color
        return view
    }()
    
    var activityIndicatorView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        return view
    }()
    
    // MARK: - Object lifecycle
        
    init() {
        status = .idle
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = .white
        
        // tableView
        addSubview(tableView)
        
        // activity
        loadingView.addSubview(activityIndicatorView)
        
        // loadingView
        addSubview(loadingView)
    }

    private func configureConstraints() {
        // tableView
        tableView.edgeAnchors == edgeAnchors
        
        loadingView.leadingAnchor == leadingAnchor
        loadingView.trailingAnchor == trailingAnchor
        loadingView.bottomAnchor == bottomAnchor
        loadingView.heightAnchor == 50
        
        activityIndicatorView.centerAnchors == loadingView.centerAnchors
    }
    
    private func refreshStatus() {
        switch status {
        case .idle:
            loadingView.isHidden = true
            activityIndicatorView.stopAnimating()
        case .loading:
            loadingView.isHidden = false
            activityIndicatorView.startAnimating()
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            HomeView()
                .makePreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            HomeView()
                .makePreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
#endif
