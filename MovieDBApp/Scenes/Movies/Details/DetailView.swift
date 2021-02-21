//
//  DetailView.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Anchorage

class DetailView: UIView {
    
    // MARK: - UI properties
    
    // MARK: - Object lifecycle
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) isn't supported")
    }

    // MARK: - Configure methods
    
    private func configureUI() {
        backgroundColor = .white
    }

    private func configureConstraints() {

    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct DetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        Group {
            DetailView()
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
