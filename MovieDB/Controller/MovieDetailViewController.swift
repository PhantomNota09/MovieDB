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
    @IBOutlet weak var movieImageView: UIImageView!
    
    /// Label displaying the movie title
    @IBOutlet weak var movieTitleLabel: UILabel!
    
    /// Label displaying the movie description
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    /// Label displaying the movie popularity score
    @IBOutlet weak var movieScoreLabel: UILabel!
    
    /// Label displaying the movie rating
    @IBOutlet weak var movieRatingLabel: UILabel!
    
    /// Label displaying the movie release year
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    
    /// Label displaying the vote count
    @IBOutlet weak var movieVoteLabel: UILabel!
    
    /// Label displaying the genre identifier
    @IBOutlet weak var movieGenreIdLabel: UILabel!
    
    // MARK: - Properties
    
    /// The movie object to display details for
    var movie: MovieModel?
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
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
        movieTitleLabel.text = movie.title
        movieDescriptionLabel.text = movie.description
        movieScoreLabel.text = movie.score
        movieRatingLabel.text = movie.rating
        movieReleaseYearLabel.text = movie.detailedYear
        movieVoteLabel.text = movie.voteCount
        movieGenreIdLabel.text = movie.genreId
        
        configureMovieImage(with: movie.image)
    }
    
    /// Configures the movie poster image view
    func configureMovieImage(with imageName: String?) {
        if let imageName = imageName {
            movieImageView.image = UIImage(systemName: imageName)
        }
    }
}
