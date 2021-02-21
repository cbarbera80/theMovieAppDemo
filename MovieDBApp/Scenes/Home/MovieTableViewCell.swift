//
//  MovieTableViewCell.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//

import Anchorage
import Kingfisher

class MovieTableViewCell: UITableViewCell, ReusableView {
    
    // MARK: - business
    private var cancellationToken: DownloadTask?
    
    // MARK: - UI
    var userAvatarView: UIImageView = {
        var view = UIImageView()
        view.layer.cornerRadius = 32
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    var titleLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configureUI()
        configureConstraints()
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        userAvatarView.image = nil
        cancellationToken?.cancel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure methods
    
    func cancelDownload() {
        cancellationToken?.cancel()
    }
    
    func configureCell(withViewModel viewModel: MovieViewModel) {
        titleLabel.text = viewModel.titleText
        cancellationToken = userAvatarView.kf.setImage(with: viewModel.backdropOriginalPictureURL, placeholder: Asset.moviePlaceholder.image)
    }
    
    private func configureUI() {
        // userAvatarView
        contentView.addSubview(userAvatarView)
        
        // usernameLabel
        contentView.addSubview(titleLabel)
    }
    
    private func configureConstraints() {
        
        userAvatarView.leadingAnchor == contentView.leadingAnchor + 16
        userAvatarView.heightAnchor == 64
        userAvatarView.widthAnchor == 64
        userAvatarView.centerYAnchor == centerYAnchor
        
        titleLabel.topAnchor == contentView.topAnchor + 32
        titleLabel.bottomAnchor == contentView.bottomAnchor - 32
        titleLabel.leadingAnchor == userAvatarView.trailingAnchor + 16
        titleLabel.trailingAnchor == trailingAnchor - 16
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MovieTableViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        MovieTableViewCell()
            .makePreview()
            .previewLayout(.fixed(width: 416, height: 80))
    }
}
#endif
