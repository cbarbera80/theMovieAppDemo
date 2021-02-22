//
//  DetailView.swift
//  MovieDBApp
//
//  Created by Claudio Barbera on 21/02/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Anchorage
import MovieDBAppModels

class DetailView: UIView {
    
    // MARK: - UI properties
    lazy var loadingView: LoadingView = {
        let view = LoadingView()
        return view
    }()
    
    lazy var yearTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Year.text
        return view
    }()
    
    lazy var yearLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.regular.font(size: 16)
        view.textColor = Asset.textColor.color
        view.numberOfLines = 0
        return view
    }()
    
    lazy var yearStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [yearTitleLabel, yearLabel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var durationTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Year.text
        return view
    }()
    
    lazy var durationLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.regular.font(size: 16)
        view.textColor = Asset.textColor.color
        view.numberOfLines = 0
        return view
    }()
    
    lazy var durationStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [durationTitleLabel, durationLabel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var genresTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Genres.text
        return view
    }()
    
    lazy var genresLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.regular.font(size: 16)
        view.textColor = Asset.textColor.color
        view.numberOfLines = 0
        return view
    }()
    
    lazy var genresStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [genresTitleLabel, genresLabel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var overviewTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Overview.text
        return view
    }()
    
    lazy var overviewLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.regular.font(size: 16)
        view.textColor = Asset.textColor.color
        view.numberOfLines = 0
        return view
    }()
    
    lazy var overviewStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [overviewTitleLabel, overviewLabel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var castTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Cast.text
        return view
    }()
    
    lazy var castCarousel: PeopleCarouselView = {
        let view = PeopleCarouselView()
        return view
    }()
    
    lazy var castStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [castTitleLabel, castCarousel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var crewTitleLabel: UILabel = {
        let view = UILabel()
        view.font = FontFamily.SourceSansPro.semibold.font(size: 16)
        view.textColor = Asset.textColor.color
        view.text = L10n.Details.Crew.text
        return view
    }()
    
    lazy var crewCarousel: PeopleCarouselView = {
        let view = PeopleCarouselView()
        return view
    }()
    
    lazy var crewStackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [crewTitleLabel, crewCarousel])

        view.axis = .vertical
        view.spacing = 4
        return view
    }()
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var stackView: UIStackView = {
        
        let view = UIStackView(arrangedSubviews: [yearStackView, durationStackView, genresStackView, overviewStackView, castStackView, crewStackView])
        
        view.axis = .vertical
        view.spacing = 16
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
    func setStatus(_ status: DetailViewStatus) {
        
        switch status {
        case .loaded(let viewModel):
            loadingView.isHidden = true
            setMovieUI(viewModel)
        case .idle:
            loadingView.isHidden = true
        case .loading:
            loadingView.isHidden = false
        case .error:
            loadingView.isHidden = true
        }
        
    }
    
    private func setMovieUI(_ viewModel: MovieViewModel) {
        overviewLabel.text = viewModel.overviewText
        genresLabel.text = viewModel.genresText
        yearLabel.text = viewModel.yearText
        durationLabel.text = viewModel.durationText
        castCarousel.items = viewModel.castViewModels ?? []
        crewCarousel.items = viewModel.crewViewModels ?? []
    }
    
    private func configureUI() {
        backgroundColor = .white
        
        // scrollView
        addSubview(scrollView)
        
        // contentView
        scrollView.addSubview(contentView)

        // Stack
        contentView.addSubview(stackView)
        
        addSubview(loadingView)
    }

    private func configureConstraints() {
        scrollView.edgeAnchors == edgeAnchors
        
        // contentView
        contentView.edgeAnchors == scrollView.edgeAnchors
        contentView.widthAnchor == widthAnchor

        // stackView
        stackView.topAnchor == contentView.topAnchor + 16
        stackView.leadingAnchor == contentView.leadingAnchor + 16
        stackView.trailingAnchor == contentView.trailingAnchor - 16
        stackView.bottomAnchor == contentView.bottomAnchor
        
        loadingView.edgeAnchors == edgeAnchors
        
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
