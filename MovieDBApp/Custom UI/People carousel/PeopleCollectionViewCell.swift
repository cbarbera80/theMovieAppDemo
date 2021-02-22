//
//  PeopleCollectionViewCell.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 22/02/21.
//

import Anchorage
import Kingfisher

class PeopleCollectionViewCell: UICollectionViewCell, ReusableView {
    
    // MARK: - business
    private var cancellationToken: DownloadTask?
    
    // MARK: - UI
    var userAvatarView: UIImageView = {
        var view = UIImageView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.contentMode = .scaleAspectFill
        view.image = Asset.moviePlaceholder.image
        return view
    }()

    var titleLabel: UILabel = {
        var view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 14)
        view.textColor = Asset.textColor.color
        return view
    }()
    
    var subtitleLabel: UILabel = {
        var view = UILabel()
        view.font = FontFamily.SourceSansPro.regular.font(size: 12)
        view.textColor = Asset.textColor.color
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
        titleLabel.text = nil
        cancellationToken?.cancel()
    }
    
    // MARK: - Configure methods
    
    func cancelDownload() {
        cancellationToken?.cancel()
    }
    
    func configureCell(withItem item: PeopleCarouselRepresentable) {
        cancellationToken = userAvatarView.kf.setImage(with: item.url, placeholder: Asset.moviePlaceholder.image)
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
    }
    
    private func configureUI() {
        // image
        contentView.addSubview(userAvatarView)
        
        // title
        contentView.addSubview(titleLabel)
        
        // subtitle
        contentView.addSubview(subtitleLabel)
    }
    
    private func configureConstraints() {
        
        userAvatarView.topAnchor == contentView.topAnchor
        userAvatarView.leadingAnchor == contentView.leadingAnchor
        userAvatarView.trailingAnchor == contentView.trailingAnchor
        userAvatarView.bottomAnchor == titleLabel.topAnchor
        
        titleLabel.leadingAnchor == contentView.leadingAnchor
        titleLabel.trailingAnchor == contentView.trailingAnchor
        titleLabel.bottomAnchor == subtitleLabel.topAnchor
        titleLabel.heightAnchor == 25
        
        subtitleLabel.leadingAnchor == contentView.leadingAnchor
        subtitleLabel.trailingAnchor == contentView.trailingAnchor
        subtitleLabel.bottomAnchor == contentView.bottomAnchor
        subtitleLabel.heightAnchor == 25
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct PeopleCollectionViewCell_Previews: PreviewProvider {
    
    static var previews: some View {
        PeopleCollectionViewCell()
            .makePreview()
            .previewLayout(.fixed(width: 416, height: 416))
    }
}
#endif
