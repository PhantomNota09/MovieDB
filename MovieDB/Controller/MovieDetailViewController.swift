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
    
    // MARK: - UI Components
    
    /// Scroll view to contain all content
    private var scrollView: UIScrollView?
    
    /// Content view inside scroll view
    private var contentView: UIView?
    
    /// Image view displaying the movie poster
    private var movieImageView: UIImageView?
    
    /// Label displaying the movie title
    private var movieTitleLabel: UILabel?
    
    /// Label displaying the movie description
    private var movieDescriptionLabel: UILabel?
    
    /// Label displaying the movie popularity score
    private var movieScoreLabel: UILabel?
    
    /// Label displaying the movie rating
    private var movieRatingLabel: UILabel?
    
    /// Label displaying the movie release year
    private var movieReleaseYearLabel: UILabel?
    
    /// Label displaying the vote count
    private var movieVoteLabel: UILabel?
    
    /// Label displaying the genre identifier
    private var movieGenreIdLabel: UILabel?
    
    // MARK: - Properties
    
    /// The movie object to display details for
    var movie: MovieModel?
    
    /// View model for formatting movie data
    private let viewModel = MovieViewModel()
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupUI()
        configureView()
    }
}

// MARK: - UI Setup

private extension MovieDetailViewController {
    
    /// Sets up all UI components and constraints
    func setupUI() {
        // Initialize scroll view
        scrollView = UIScrollView()
        scrollView?.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialize content view
        contentView = UIView()
        contentView?.translatesAutoresizingMaskIntoConstraints = false
        
        // Initialize title label
        movieTitleLabel = UILabel()
        movieTitleLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        movieTitleLabel?.numberOfLines = 0
        movieTitleLabel?.textAlignment = .center
        
        // Initialize image view
        movieImageView = UIImageView()
        movieImageView?.translatesAutoresizingMaskIntoConstraints = false
        movieImageView?.contentMode = .scaleAspectFit
        movieImageView?.tintColor = .lightGray
        
        // Initialize description label
        movieDescriptionLabel = UILabel()
        movieDescriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel?.font = UIFont.systemFont(ofSize: 16)
        movieDescriptionLabel?.numberOfLines = 0
        movieDescriptionLabel?.textAlignment = .center
        
        // Initialize score label
        movieScoreLabel = UILabel()
        movieScoreLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieScoreLabel?.font = UIFont.systemFont(ofSize: 16)
        movieScoreLabel?.numberOfLines = 0
        movieScoreLabel?.textAlignment = .center
        
        // Initialize rating label
        movieRatingLabel = UILabel()
        movieRatingLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieRatingLabel?.font = UIFont.systemFont(ofSize: 16)
        movieRatingLabel?.numberOfLines = 0
        movieRatingLabel?.textAlignment = .center
        
        // Initialize release year label
        movieReleaseYearLabel = UILabel()
        movieReleaseYearLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieReleaseYearLabel?.font = UIFont.systemFont(ofSize: 16)
        movieReleaseYearLabel?.numberOfLines = 0
        movieReleaseYearLabel?.textAlignment = .center
        
        // Initialize vote label
        movieVoteLabel = UILabel()
        movieVoteLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieVoteLabel?.font = UIFont.systemFont(ofSize: 16)
        movieVoteLabel?.numberOfLines = 0
        movieVoteLabel?.textAlignment = .center
        
        // Initialize genre ID label
        movieGenreIdLabel = UILabel()
        movieGenreIdLabel?.translatesAutoresizingMaskIntoConstraints = false
        movieGenreIdLabel?.font = UIFont.systemFont(ofSize: 16)
        movieGenreIdLabel?.numberOfLines = 0
        movieGenreIdLabel?.textAlignment = .center
        
        // Add all subviews and set up constraints in one if let
        if let scrollView = scrollView,
           let contentView = contentView,
           let movieTitleLabel = movieTitleLabel,
           let movieImageView = movieImageView,
           let movieDescriptionLabel = movieDescriptionLabel,
           let movieScoreLabel = movieScoreLabel,
           let movieRatingLabel = movieRatingLabel,
           let movieReleaseYearLabel = movieReleaseYearLabel,
           let movieVoteLabel = movieVoteLabel,
           let movieGenreIdLabel = movieGenreIdLabel {
            
            // Add scroll view to main view
            view.addSubview(scrollView)
            
            // Add content view to scroll view
            scrollView.addSubview(contentView)
            
            // Add all labels and image view to content view
            contentView.addSubview(movieTitleLabel)
            contentView.addSubview(movieImageView)
            contentView.addSubview(movieDescriptionLabel)
            contentView.addSubview(movieScoreLabel)
            contentView.addSubview(movieRatingLabel)
            contentView.addSubview(movieReleaseYearLabel)
            contentView.addSubview(movieVoteLabel)
            contentView.addSubview(movieGenreIdLabel)
            
            // Activate all constraints at once
            NSLayoutConstraint.activate([
                // Scroll view constraints
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
                // Content view constraints
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                // Title label constraints
                movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
                movieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Image view constraints
                movieImageView.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 20),
                movieImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                movieImageView.widthAnchor.constraint(equalToConstant: 200),
                movieImageView.heightAnchor.constraint(equalToConstant: 250),
                
                // Description label constraints
                movieDescriptionLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: 20),
                movieDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Score label constraints
                movieScoreLabel.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant: 16),
                movieScoreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieScoreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Rating label constraints
                movieRatingLabel.topAnchor.constraint(equalTo: movieScoreLabel.bottomAnchor, constant: 16),
                movieRatingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieRatingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Release year label constraints
                movieReleaseYearLabel.topAnchor.constraint(equalTo: movieRatingLabel.bottomAnchor, constant: 16),
                movieReleaseYearLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieReleaseYearLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Vote label constraints
                movieVoteLabel.topAnchor.constraint(equalTo: movieReleaseYearLabel.bottomAnchor, constant: 16),
                movieVoteLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieVoteLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                
                // Genre ID label constraints
                movieGenreIdLabel.topAnchor.constraint(equalTo: movieVoteLabel.bottomAnchor, constant: 16),
                movieGenreIdLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                movieGenreIdLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                movieGenreIdLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
            ])
        }
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
        // Using view model's formatting methods
        movieTitleLabel?.text = viewModel.formatTitle(movie.title)
        movieDescriptionLabel?.text = movie.plotDescription
        movieScoreLabel?.text = viewModel.formatPopularityScore(movie.popularityScore)
        movieRatingLabel?.text = viewModel.formatRating(movie.rating)
        movieReleaseYearLabel?.text = viewModel.formatReleaseDate(movie.releaseDate)
        movieVoteLabel?.text = viewModel.formatVoteCount(movie.voteCount)
        movieGenreIdLabel?.text = viewModel.formatGenreId(movie.genreId)
        
        // Set movie poster image
        movieImageView?.image = UIImage(systemName: movie.imageName)
    }
}
