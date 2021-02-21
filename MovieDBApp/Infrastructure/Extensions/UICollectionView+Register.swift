//
//  UICollectionView+Register.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import UIKit

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableView {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
        
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}

extension UICollectionView {
    func register<T: UICollectionReusableView>(_: T.Type) where T: (ReusableView & ReusableSupplementaryView) {
        register(T.self, forSupplementaryViewOfKind: T.kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(_: T.Type, for indexPath: IndexPath) -> T where T: (ReusableView & ReusableSupplementaryView) {
        guard let view = dequeueReusableSupplementaryView(ofKind: T.kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else { fatalError() }
        return view
    }
}
