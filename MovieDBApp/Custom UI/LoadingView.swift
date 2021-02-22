//
//  LoadingView.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Anchorage

class LoadingView: UIView {
    
    // MARK: - UI properties
   
    lazy var loadingIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.startAnimating()
        return view
    }()
    
    // MARK: - Object lifecycle
        
    init() {
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
        
        // loadingIndicator
        addSubview(loadingIndicator)
    
    }

    private func configureConstraints() {
        loadingIndicator.centerAnchors == centerAnchors
        
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct LoadingView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            LoadingView()
                .makePreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
                .previewDisplayName("iPhone SE")
            
            DetailView()
                .makePreview()
                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
                .previewDisplayName("iPhone 8")
        }
    }
}
#endif
