//
//  MovieTableViewCell.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    // Image view for movie poster
    var moviePosterImageView = UIImageView()
    
    // Label for movie title
    var movieTitleLabel = UILabel()
    
    // Label for movie score
    var movieScoreLabel = UILabel()
    
    // Label for movie release year
    var movieReleaseLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Setup image view
        moviePosterImageView.contentMode = .scaleAspectFit
        moviePosterImageView.tintColor = .systemGray
        moviePosterImageView.backgroundColor = .systemGray5
        moviePosterImageView.layer.cornerRadius = 8
        moviePosterImageView.clipsToBounds = true
        moviePosterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup title label
        movieTitleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        movieTitleLabel.textColor = .black
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup score label
        movieScoreLabel.font = .systemFont(ofSize: 14, weight: .regular)
        movieScoreLabel.textColor = .black
        movieScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Setup release year label
        movieReleaseLabel.font = .systemFont(ofSize: 14, weight: .regular)
        movieReleaseLabel.textColor = .black
        movieReleaseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Add arrow on the right
        accessoryType = .disclosureIndicator
        
        // Add image view to cell
        contentView.addSubview(moviePosterImageView)
        
        // Add labels directly to content view
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieScoreLabel)
        contentView.addSubview(movieReleaseLabel)
        
        // Setup constraints for image view
        moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        moviePosterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        moviePosterImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        moviePosterImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        // Setup constraints for title label (top label)
        movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 45).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        // Setup constraints for score label (middle label, below title with 8pt spacing)
        movieScoreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 8).isActive = true
        movieScoreLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16).isActive = true
        movieScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        // Setup constraints for release label (bottom label, below score with 8pt spacing)
        movieReleaseLabel.topAnchor.constraint(equalTo: movieScoreLabel.bottomAnchor, constant: 8).isActive = true
        movieReleaseLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 16).isActive = true
        movieReleaseLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        movieReleaseLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
