//
//  PeopleCarouselView.swift
//  Created by Claudio Barbera on 14/02/21.
//  Copyright © 2021. All rights reserved.
//

import Anchorage

class PeopleCarouselView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    // MARK: - Properties
    var items: [PeopleCarouselRepresentable] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // MARK: - UI
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.backgroundColor = .clear
        view.register(PeopleCollectionViewCell.self)
        return view
    }()

    // MARK: - Initialization
    init() {
        super.init(frame: .zero)
        configureUI()
        configureConstraints()
        collectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure methods
    
    private func configureUI() {
        addSubview(collectionView)
    }
    
    private func configureConstraints() {
        collectionView.edgeAnchors == edgeAnchors
        heightAnchor == 150
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PeopleCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configureCell(withItem: items[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: 150)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct CartCarouselView_Previews: PreviewProvider {
    
    static var previews: some View {
        PeopleCarouselView()
            .makePreview()
            .previewLayout(.fixed(width: 320, height: 150))
    }
}
#endif
