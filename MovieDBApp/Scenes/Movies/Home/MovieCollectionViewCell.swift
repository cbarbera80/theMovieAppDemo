//
//  MovieTableViewCell.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Anchorage
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell, ReusableView {
    
    // MARK: - business
    private var cancellationToken: DownloadTask?
    
    // MARK: - UI
    var userAvatarView: UIImageView = {
        var view = UIImageView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()

        userAvatarView.image = nil
        cancellationToken?.cancel()
    }
    
    // MARK: - Configure methods
    
    func cancelDownload() {
        cancellationToken?.cancel()
    }
    
    func configureCell(withViewModel viewModel: MovieViewModel) {
       cancellationToken = userAvatarView.kf.setImage(with: viewModel.posterW500PictureURL, placeholder: Asset.moviePlaceholder.image)
    }
    
    private func configureUI() {
        // image
        contentView.addSubview(userAvatarView)
    }
    
    private func configureConstraints() {
        
        userAvatarView.edgeAnchors == edgeAnchors
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MovieCollectionViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieCollectionViewCell()
            .makePreview()
            .previewLayout(.fixed(width: 416, height: 80))
    }
}
#endif
