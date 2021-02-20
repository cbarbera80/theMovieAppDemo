//
//  UIView+Preview.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 20/02/21.
//

import Foundation
import SwiftUI

extension UIView {
    
    private struct Preview<View: UIView>: UIViewRepresentable {
        
        // MARK: - Properties
        
        let view: View
        
        // MARK: - Methods

        func makeUIView(context: Context) -> View { view }
        
        func updateUIView(_ uiView: View, context: Context) {}
    }

    func makePreview() -> some View {
        Preview(view: self)
    }
}
