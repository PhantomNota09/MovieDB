//
//  MovieCollectionViewCell.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/4/26.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    // Image view for movie poster
    var moviePosterImageView = UIImageView()
    
    // Label for movie title
    var movieTitleLabel = UILabel()
    
    // Label for movie score
    var movieScoreLabel = UILabel()
    
    // Label for movie release year
    var movieReleaseLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup cell appearance with rounded corners and shadow
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        // Add subtle border
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray5.cgColor
        
        // Setup image view
        moviePosterImageView.contentMode = .scaleAspectFit
        moviePosterImageView.tintColor = .systemGray
        moviePosterImageView.backgroundColor = .systemGray6
        moviePosterImageView.layer.cornerRadius = 8
        moviePosterImageView.clipsToBounds = true
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup title label
        movieTitleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        movieTitleLabel.textColor = .label
        movieTitleLabel.numberOfLines = 2
        movieTitleLabel.textAlignment = .center
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup score label
        movieScoreLabel.font = .systemFont(ofSize: 12, weight: .regular)
        movieScoreLabel.textColor = .secondaryLabel
        movieScoreLabel.numberOfLines = 1
        movieScoreLabel.textAlignment = .center
        movieScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup release year label
        movieReleaseLabel.font = .systemFont(ofSize: 12, weight: .regular)
        movieReleaseLabel.textColor = .secondaryLabel
        movieReleaseLabel.numberOfLines = 1
        movieReleaseLabel.textAlignment = .center
        movieReleaseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add subviews
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieScoreLabel)
        contentView.addSubview(movieReleaseLabel)
        
        // Setup constraints with improved spacing
        NSLayoutConstraint.activate([
            // Image view constraints - centered at top with more padding
            moviePosterImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            moviePosterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 100),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 120),
            
            // Title label constraints with better spacing
            movieTitleLabel.topAnchor.constraint(equalTo: moviePosterImageView.bottomAnchor, constant: 8),
            movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // Score label constraints with improved spacing
            movieScoreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 4),
            movieScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            movieScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // Release label constraints with more bottom padding
            movieReleaseLabel.topAnchor.constraint(equalTo: movieScoreLabel.bottomAnchor, constant: 4),
            movieReleaseLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            movieReleaseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            movieReleaseLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
