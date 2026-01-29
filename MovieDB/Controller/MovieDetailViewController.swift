//
//  MovieDetailViewController.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Movie Detail View Controller

/// Displays detailed information about a selected movie
final class MovieDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    /// Image view displaying the movie poster
    var movieImageView: UIImageView?
    
    /// Label displaying the movie title
    var movieTitleLabel: UILabel?
    
    /// Label displaying the movie description
    var movieDescriptionLabel: UILabel?
    
    /// Label displaying the movie popularity score
    var movieScoreLabel: UILabel?
    
    /// Label displaying the movie rating
    var movieRatingLabel: UILabel?
    
    /// Label displaying the movie release year
    var movieReleaseYearLabel: UILabel?
    
    /// Label displaying the vote count
    var movieVoteLabel: UILabel?
    
    /// Label displaying the genre identifier
    var movieGenreIdLabel: UILabel?
    
    // MARK: - Properties
    
    /// The movie object to display details for
    var movie: MovieModel?
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        movieTitleLabel = UILabel()
        movieTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        movieTitleLabel?.numberOfLines = 1
        movieTitleLabel?.textAlignment = .center
        if let movieTitleLabel = movieTitleLabel {
            view.addSubview(movieTitleLabel)
            NSLayoutConstraint.activate([
                movieTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant : 16),
                movieTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                movieTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
            ])
        }
        
        movieImageView = UIImageView()
        movieImageView?.translatesAutoresizingMaskIntoConstraints = false
        movieImageView?.contentMode = .scaleAspectFit
        movieImageView?.tintColor = .lightGray
        if let movieImageView = movieImageView, let movieTitleLabel = movieTitleLabel {
            view.addSubview(movieImageView)
            NSLayoutConstraint.activate([
                movieImageView.topAnchor.constraint(equalTo: movieTitleLabel.topAnchor, constant : 60),
                movieImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
                movieImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
                movieImageView.heightAnchor.constraint(equalToConstant: 250),
                movieImageView.widthAnchor.constraint(equalToConstant: 220)
            ])
        }
        
        movieDescriptionLabel = UILabel()
        movieDescriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieDescriptionLabel?.numberOfLines = 0
        movieDescriptionLabel?.textAlignment = .center
        if let movieDescriptionLabel = movieDescriptionLabel, let movieImageView = movieImageView {
            view.addSubview(movieDescriptionLabel)
            NSLayoutConstraint.activate([
                movieDescriptionLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant : 30),
                movieDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        
        movieScoreLabel = UILabel()
        movieScoreLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieScoreLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieScoreLabel?.numberOfLines = 0
        movieScoreLabel?.textAlignment = .center
        if let movieScoreLabel = movieScoreLabel, let movieDescriptionLabel = movieDescriptionLabel {
            view.addSubview(movieScoreLabel)
            NSLayoutConstraint.activate([
                movieScoreLabel.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant : 30),
                movieScoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieScoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        movieRatingLabel = UILabel()
        movieRatingLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieRatingLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieRatingLabel?.numberOfLines = 0
        movieRatingLabel?.textAlignment = .center
        if let movieRatingLabel = movieRatingLabel, let movieScoreLabel = movieScoreLabel {
            view.addSubview(movieRatingLabel)
            NSLayoutConstraint.activate([
                movieRatingLabel.topAnchor.constraint(equalTo: movieScoreLabel.bottomAnchor, constant : 30),
                movieRatingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieRatingLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        movieReleaseYearLabel = UILabel()
        movieReleaseYearLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseYearLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieReleaseYearLabel?.numberOfLines = 0
        movieReleaseYearLabel?.textAlignment = .center
        if let movieRatingLabel = movieRatingLabel, let movieReleaseYearLabel = movieReleaseYearLabel {
            view.addSubview(movieReleaseYearLabel)
            NSLayoutConstraint.activate([
                movieReleaseYearLabel.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant : 30),
                movieReleaseYearLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieReleaseYearLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        movieVoteLabel = UILabel()
        movieVoteLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieVoteLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieVoteLabel?.numberOfLines = 0
        movieVoteLabel?.textAlignment = .center
        if let movieVoteLabel = movieVoteLabel, let movieReleaseYearLabel = movieReleaseYearLabel {
            view.addSubview(movieVoteLabel)
            NSLayoutConstraint.activate([
                movieVoteLabel.topAnchor.constraint(equalTo: movieReleaseYearLabel.bottomAnchor, constant : 30),
                movieVoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieVoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        movieGenreIdLabel = UILabel()
        movieGenreIdLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieGenreIdLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        movieGenreIdLabel?.numberOfLines = 0
        movieGenreIdLabel?.textAlignment = .center
        if let movieGenreIdLabel = movieGenreIdLabel, let movieVoteLabel = movieVoteLabel {
            view.addSubview(movieGenreIdLabel)
            NSLayoutConstraint.activate([
                movieGenreIdLabel.topAnchor.constraint(equalTo: movieVoteLabel.bottomAnchor, constant : 30),
                movieGenreIdLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                movieGenreIdLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
        
        configureView()
    }
}

// MARK: - Configuration

private extension MovieDetailViewController {
    
    /// Configures the view with movie data
    func configureView() {
        guard let movie = movie else { return }
        populateMovieDetails(with: movie)
    }
    
    /// Populates all UI elements with movie information
    func populateMovieDetails(with movie: MovieModel) {
        movieTitleLabel?.text = movie.title
        movieDescriptionLabel?.text = movie.description
        movieScoreLabel?.text = movie.score
        movieRatingLabel?.text = movie.rating
        movieReleaseYearLabel?.text = movie.detailedYear
        movieVoteLabel?.text = movie.voteCount
        movieGenreIdLabel?.text = movie.genreId
        
        configureMovieImage(with: movie.image)
    }
    
    /// Configures the movie poster image view
    func configureMovieImage(with imageName: String?) {
        if let imageName = imageName {
            movieImageView?.image = UIImage(systemName: imageName)
        }
    }
}
