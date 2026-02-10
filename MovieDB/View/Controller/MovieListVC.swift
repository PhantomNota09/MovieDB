//
//  MovieListVC.swift
//  MovieDB
//
//  Created by Surya Rayala on 1/26/26.
//

import UIKit

// MARK: - Movie List View Controller

class MovieListVC: UIViewController {
    
    // MARK: - Properties
    
    // Table View (Commented Out)
//    var movieTableView: UITableView?
    
    // Collection View
    var movieCollectionView: UICollectionView?
    var pageLabel: UILabel?
    
    /// View model managing movie data and business logic
    let viewModel = MovieViewModel()
    
    // Table View Configuration (Commented Out)
//    /// Enum for table view configuration values
//    enum TableViewConfig {
//        static let rowHeight: CGFloat = 160
//        static let numberOfSections = 1
//    }
    
    /// Enum for collection view configuration values
    enum CollectionViewConfig {
        static let numberOfSections = 1
    }
    
    // Cell Identifiers (Commented Out)
//    /// Enum for cell identifiers
//    enum Identifiers {
//        static let movieTableViewCell = "MovieTableViewCell"
//    }
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupTitleLabel()
        
        // Table View Setup (Commented Out)
//        setupTableView()
        
        // Collection View Setup
        setupCollectionView()
        
        Task {
           await viewModel.loadMovies() // load movies
           movieCollectionView?.reloadData() // Refresh the collection view to show movies
        }
    }
}

// MARK: - Setup Methods

private extension MovieListVC {
    
    func setupTitleLabel() {
        pageLabel = UILabel()
        pageLabel?.text = "Movie List"
        pageLabel?.textColor = .black
        pageLabel?.backgroundColor = .white
        pageLabel?.font = UIFont.boldSystemFont(ofSize: 32)
        pageLabel?.textAlignment = .center
        pageLabel?.numberOfLines = 0
        pageLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        if let pageLabel = pageLabel{
            view.addSubview(pageLabel)
            NSLayoutConstraint.activate([
                pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                pageLabel.heightAnchor.constraint(equalToConstant: 35),
                pageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }
    
    // Table View Setup (Commented Out)
//    /// Configures the table view delegate and data source
//    func setupTableView() {
//        movieTableView = UITableView()
//        movieTableView?.delegate = self
//        movieTableView?.dataSource = self
//        movieTableView?.register(MovieTableViewCell.self, forCellReuseIdentifier: Identifiers.movieTableViewCell)
//        movieTableView?.translatesAutoresizingMaskIntoConstraints = false
//
//        if let tableView = movieTableView, let pageLabel = pageLabel {
//            view.addSubview(tableView)
//            NSLayoutConstraint.activate([
//                tableView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: -70),
//                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//            ])
//        }
//    }
    
    /// Configures the collection view delegate and data source
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        
        // Cell sizing
        // layout.itemSize = CGSize(width: 160, height: 220)
        layout.itemSize = CGSize(width: view.frame.width/2.25, height: view.frame.width/2)
        
        // Vertical scroll direction
        layout.scrollDirection = .vertical
        
        // Section insets for padding
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // Spacing between items
        // layout.minimumInteritemSpacing = 10  // Horizontal spacing between items
        // layout.minimumLineSpacing = 15       // Vertical spacing between rows
        
        movieCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        movieCollectionView?.backgroundColor = .systemBackground
        movieCollectionView?.delegate = self
        movieCollectionView?.dataSource = self
        movieCollectionView?.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Identifiers.movieCollectionViewCell)
        movieCollectionView?.translatesAutoresizingMaskIntoConstraints = false
        
        if let collectionView = movieCollectionView, let pageLabel = pageLabel {
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 10),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }
}

// MARK: - UITableViewDataSource (Commented Out)

//extension MovieListVC: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return TableViewConfig.numberOfSections
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.numberOfMovies
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.movieTableViewCell, for: indexPath) as? MovieTableViewCell else {
//            return UITableViewCell()
//        }
//
//        guard let movie = viewModel.movie(at: indexPath.row) else {
//            return cell
//        }
//
//        configureCell(cell, with: movie)
//
//        return cell
//    }
//}

// MARK: - UICollectionViewDataSource

extension MovieListVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CollectionViewConfig.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.movieCollectionViewCell, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let movie = viewModel.movie(at: indexPath.item) else {
            return cell
        }
        
        configureCollectionCell(cell, with: movie)
        
        return cell
    }
}

// MARK: - UITableViewDelegate (Commented Out)

//extension MovieListVC: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return TableViewConfig.rowHeight
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        guard let selectedMovie = viewModel.movie(at: indexPath.row) else {
//            return
//        }
//
//        navigateToMovieDetail(with: selectedMovie)
//    }
//}

// MARK: - UICollectionViewDelegate

extension MovieListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedMovie = viewModel.movie(at: indexPath.item) else {
            return
        }
        
        navigateToMovieDetail(with: selectedMovie)
    }
}


// MARK: - Cell Configuration

private extension MovieListVC {
    
    // Table View Cell Configuration (Commented Out)
//    /// Configures a movie cell with the provided movie data
//    func configureCell(_ cell: MovieTableViewCell, with movie: MovieModel) {
//        // Using view model's formatting methods
//        cell.movieTitleLabel.text = viewModel.formatTitle(movie.title)
//        cell.movieScoreLabel.text = viewModel.formatPopularityScore(movie.popularityScore)
//        cell.movieReleaseLabel.text = viewModel.formatReleaseYear(movie.releaseYear)
//
//        // Set poster image
//        cell.moviePosterImageView.image = UIImage(systemName: movie.imageName)
//    }
    
    /// Configures a movie collection cell with the provided movie data
    func configureCollectionCell(_ cell: MovieCollectionViewCell, with movie: MovieModel) {
        
        let rating = String(format: "%.1f", movie.vote_average ?? 0)

        cell.movieTitleLabel.text = movie.title
        
        cell.movieReleaseLabel.text = "Year: \(movie.release_date ?? "Unknown")"
        
        cell.movieScoreLabel.text = "Rating: \(rating)"
        
        let imagePath = Server.ImageBaseUrl.rawValue + (movie.poster_path ?? "")
        Task {
                await cell.moviePosterImageView.loadImage(url: imagePath)
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
