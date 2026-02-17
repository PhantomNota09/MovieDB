//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Movie Detail View Controller

final class MovieDetailViewController: UIViewController {
    
    // MARK: - UI Components
    
    // Scroll view
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // Hero banner at top
    private let heroImageView = UIImageView()
    
    // Info card section
    private let posterIconView = UIImageView()
    private let movieTitleLabel = UILabel()
    private let genreLabel = UILabel()
    
    // Stats section (Rating, Year, Popularity)
    private let ratingValueLabel = UILabel()
    private let ratingTitleLabel = UILabel()
    
    private let yearValueLabel = UILabel()
    private let yearTitleLabel = UILabel()
    
    private let popularityValueLabel = UILabel()
    private let popularityTitleLabel = UILabel()
    
    // Overview section
    private let overviewHeaderLabel = UILabel()
    private let overviewTextLabel = UILabel()
    
    // Details section
    private let detailsHeaderLabel = UILabel()
    private let releaseDateValueLabel = UILabel()
    private let voteCountValueLabel = UILabel()
    private let genreIdValueLabel = UILabel()
    
    // MARK: - Properties
    
    var movie: MovieModel?
    
    private let viewModel = MovieViewModel()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        setupUI()
        configureView()
    }
}

// MARK: - UI Setup

private extension MovieDetailViewController {
    
    func setupUI() {
        // Setup scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        view.addSubview(scrollView)
        
        // Setup content view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        // Setup hero image
        heroImageView.translatesAutoresizingMaskIntoConstraints = false
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        contentView.addSubview(heroImageView)
        
        // Setup poster icon
        posterIconView.translatesAutoresizingMaskIntoConstraints = false
        posterIconView.contentMode = .scaleAspectFit
        posterIconView.tintColor = .label
        posterIconView.layer.cornerRadius = 20
        posterIconView.clipsToBounds = true
        posterIconView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(posterIconView)
        
        // Setup title label
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        movieTitleLabel.numberOfLines = 2
        contentView.addSubview(movieTitleLabel)
        
        // Setup genre label
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        genreLabel.textColor = .secondaryLabel
        genreLabel.numberOfLines = 1
        contentView.addSubview(genreLabel)
        
        // Setup rating stat
        ratingValueLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        ratingValueLabel.textAlignment = .center
        contentView.addSubview(ratingValueLabel)
        
        ratingTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        ratingTitleLabel.textColor = .secondaryLabel
        ratingTitleLabel.textAlignment = .center
        contentView.addSubview(ratingTitleLabel)
        
        // Setup year stat
        yearValueLabel.translatesAutoresizingMaskIntoConstraints = false
        yearValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        yearValueLabel.textAlignment = .center
        contentView.addSubview(yearValueLabel)
        
        yearTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        yearTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        yearTitleLabel.textColor = .secondaryLabel
        yearTitleLabel.textAlignment = .center
        contentView.addSubview(yearTitleLabel)
        
        // Setup popularity stat
        popularityValueLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityValueLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        popularityValueLabel.textAlignment = .center
        contentView.addSubview(popularityValueLabel)
        
        popularityTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        popularityTitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        popularityTitleLabel.textColor = .secondaryLabel
        popularityTitleLabel.textAlignment = .center
        contentView.addSubview(popularityTitleLabel)
        
        // Setup overview section
        overviewHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewHeaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        overviewHeaderLabel.text = "Overview"
        contentView.addSubview(overviewHeaderLabel)
        
        overviewTextLabel.translatesAutoresizingMaskIntoConstraints = false
        overviewTextLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        overviewTextLabel.textColor = .secondaryLabel
        overviewTextLabel.numberOfLines = 0
        contentView.addSubview(overviewTextLabel)
        
        // Setup details section
        detailsHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
        detailsHeaderLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        detailsHeaderLabel.text = "Details"
        contentView.addSubview(detailsHeaderLabel)
        
        releaseDateValueLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        releaseDateValueLabel.numberOfLines = 0
        contentView.addSubview(releaseDateValueLabel)
        
        voteCountValueLabel.translatesAutoresizingMaskIntoConstraints = false
        voteCountValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        voteCountValueLabel.numberOfLines = 0
        contentView.addSubview(voteCountValueLabel)
        
        genreIdValueLabel.translatesAutoresizingMaskIntoConstraints = false
        genreIdValueLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        genreIdValueLabel.numberOfLines = 0
        contentView.addSubview(genreIdValueLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Content view
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // Hero image
            heroImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            heroImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            heroImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            heroImageView.heightAnchor.constraint(equalToConstant: 280),
            
            // Poster icon
            posterIconView.topAnchor.constraint(equalTo: heroImageView.bottomAnchor, constant: 20),
            posterIconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            posterIconView.widthAnchor.constraint(equalToConstant: 80),
            posterIconView.heightAnchor.constraint(equalToConstant: 80),
            
            // Title label
            movieTitleLabel.leadingAnchor.constraint(equalTo: posterIconView.trailingAnchor, constant: 16),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            movieTitleLabel.topAnchor.constraint(equalTo: posterIconView.topAnchor, constant: 8),
            
            // Genre label
            genreLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
            genreLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor),
            genreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 4),
            
            // Rating stat (left)
            ratingValueLabel.topAnchor.constraint(equalTo: posterIconView.bottomAnchor, constant: 30),
            ratingValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ratingValueLabel.trailingAnchor.constraint(equalTo: yearValueLabel.leadingAnchor, constant: -8),
            
            ratingTitleLabel.topAnchor.constraint(equalTo: ratingValueLabel.bottomAnchor, constant: 2),
            ratingTitleLabel.leadingAnchor.constraint(equalTo: ratingValueLabel.leadingAnchor),
            ratingTitleLabel.trailingAnchor.constraint(equalTo: ratingValueLabel.trailingAnchor),
            
            // Year stat (center)
            yearValueLabel.topAnchor.constraint(equalTo: ratingValueLabel.topAnchor),
            yearValueLabel.widthAnchor.constraint(equalTo: ratingValueLabel.widthAnchor),
            yearValueLabel.trailingAnchor.constraint(equalTo: popularityValueLabel.leadingAnchor, constant: -8),
            
            yearTitleLabel.topAnchor.constraint(equalTo: yearValueLabel.bottomAnchor, constant: 2),
            yearTitleLabel.leadingAnchor.constraint(equalTo: yearValueLabel.leadingAnchor),
            yearTitleLabel.trailingAnchor.constraint(equalTo: yearValueLabel.trailingAnchor),
            
            // Popularity stat (right)
            popularityValueLabel.topAnchor.constraint(equalTo: ratingValueLabel.topAnchor),
            popularityValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            popularityValueLabel.widthAnchor.constraint(equalTo: ratingValueLabel.widthAnchor),
            
            popularityTitleLabel.topAnchor.constraint(equalTo: popularityValueLabel.bottomAnchor, constant: 2),
            popularityTitleLabel.leadingAnchor.constraint(equalTo: popularityValueLabel.leadingAnchor),
            popularityTitleLabel.trailingAnchor.constraint(equalTo: popularityValueLabel.trailingAnchor),
            
            // Overview section
            overviewHeaderLabel.topAnchor.constraint(equalTo: ratingTitleLabel.bottomAnchor, constant: 32),
            overviewHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            overviewHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            overviewTextLabel.topAnchor.constraint(equalTo: overviewHeaderLabel.bottomAnchor, constant: 8),
            overviewTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            overviewTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Details section
            detailsHeaderLabel.topAnchor.constraint(equalTo: overviewTextLabel.bottomAnchor, constant: 32),
            detailsHeaderLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            detailsHeaderLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Release Date
            releaseDateValueLabel.topAnchor.constraint(equalTo: detailsHeaderLabel.bottomAnchor, constant: 12),
            releaseDateValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            releaseDateValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Vote Count
            voteCountValueLabel.topAnchor.constraint(equalTo: releaseDateValueLabel.bottomAnchor, constant: 8),
            voteCountValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            voteCountValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            // Genre ID
            genreIdValueLabel.topAnchor.constraint(equalTo: voteCountValueLabel.bottomAnchor, constant: 8),
            genreIdValueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            genreIdValueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            genreIdValueLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40)
        ])
    }
}

// MARK: - Configuration

private extension MovieDetailViewController {
    
    func configureView() {
        guard let movie = movie else { return }
        
        // Hero image
        let coverImagePath = Server.ImageBaseUrl.rawValue + (movie.backdropPath ?? "")
        Task{
            await heroImageView.loadImage(url: coverImagePath)
        }
        
        heroImageView.tintColor = .systemGray
        
        // Poster icon
        let posterImagePath = Server.ImageBaseUrl.rawValue + (movie.posterPath ?? "")
        Task{
            await posterIconView.loadImage(url: posterImagePath)
        }
        
        // Title and genre
        movieTitleLabel.text = movie.title
        genreLabel.text = "\(movie.genreIds ?? [0])"
        
        // Rating stat
        ratingValueLabel.text = String(format: "%.1f", movie.voteAverage ?? 0)
        ratingTitleLabel.text = "Rating"
        
        // Year stat
        yearValueLabel.text = "\(movie.releaseDate ?? "ReleaseDateMissing")"
        yearTitleLabel.text = "Release Date"
        
        // Popularity stat
        popularityValueLabel.text = String(format: "%.3f", movie.popularity ?? 0)
        popularityTitleLabel.text = "Popularity Score"
        
        // Overview
        overviewTextLabel.text = movie.overview
        
        // Details
        releaseDateValueLabel.text = "\(viewModel.formatReleaseDate(movie.releaseDate ?? "releaseDateMissing"))"
        voteCountValueLabel.text = "\(viewModel.formatVoteCount(movie.voteCount ?? 0))"
        genreIdValueLabel.text = "Genre IDs: \(movie.genreIds ?? [0])"
    }
}
