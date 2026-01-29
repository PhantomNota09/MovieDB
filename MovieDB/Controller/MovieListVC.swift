//
//  MovieListVC.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Movie List View Controller

/// Displays a list of movies in a table view with navigation to detail screen
final class MovieListVC: UIViewController {
    
    // MARK: - Constants
    var movieTableView: UITableView?
    private var movieData: [MovieModel] = []
    
    /// Enum for table view configuration values
    private enum TableViewConfig {
        static let rowHeight: CGFloat = 160
        static let numberOfSections = 1
    }
    
    /// Enum for cell identifiers
    private enum Identifiers {
        static let movieTableViewCell = "MovieTableViewCell"
    }
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadMovieData()
    }
}

// MARK: - Setup Methods

private extension MovieListVC {
    
    /// Configures the table view delegate and data source
    func setupTableView() {
        movieTableView = UITableView()
        movieTableView?.delegate = self
        movieTableView?.dataSource = self
        movieTableView?.register(MovieTableViewCell.self, forCellReuseIdentifier: Identifiers.movieTableViewCell)
        movieTableView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let tableView = movieTableView {
            view.addSubview(tableView)
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }
    
    /// Loads movie data from mock data source
    func loadMovieData() {
        movieData = MockData()
    }
}

// MARK: - UITableViewDataSource

extension MovieListVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return TableViewConfig.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.movieTableViewCell, for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = movieData[indexPath.row]
        configureCell(cell, with: movie)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension MovieListVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return TableViewConfig.rowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedMovie = movieData[indexPath.row]
        navigateToMovieDetail(with: selectedMovie)
    }
}

// MARK: - Cell Configuration

private extension MovieListVC {
    
    /// Configures a movie cell with the provided movie data
    func configureCell(_ cell: MovieTableViewCell, with movie: MovieModel) {
        cell.movieTitleLabel.text = movie.title ?? ""
        cell.movieScoreLabel.text = movie.score ?? ""
        cell.movieReleaseLabel.text = movie.year ?? ""
        
        // Set poster image if available
        if let imageName = movie.image {
            cell.moviePosterImageView.image = UIImage(systemName: imageName)
        }
    }
}

// MARK: - Navigation

private extension MovieListVC {
    
    /// Navigates to the movie detail screen with the selected movie
    func navigateToMovieDetail(with movie: MovieModel) {
        let detailVC = MovieDetailViewController()
        detailVC.movie = movie
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
