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
    var searchBar: UISearchBar?
    
    /// View model managing movie data and business logic
    let viewModel = MovieViewModel()
    
    /// Filtered movies based on search
    var filteredMovies: [MovieModel] = []
    
    /// Flag to check if we're currently searching
    var isSearching: Bool {
        return searchBar?.text?.isEmpty == false
    }
    
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
        setupSearchBar()
        
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
                pageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -40),
                pageLabel.heightAnchor.constraint(equalToConstant: 35),
                pageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                pageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        }
    }
    
    /// Configures the search bar
    func setupSearchBar() {
        searchBar = UISearchBar()
        searchBar?.delegate = self
        searchBar?.placeholder = "Search movies..."
        searchBar?.translatesAutoresizingMaskIntoConstraints = false
        
        if let searchBar = searchBar, let pageLabel = pageLabel {
            view.addSubview(searchBar)
            NSLayoutConstraint.activate([
                searchBar.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 5),
                searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                searchBar.heightAnchor.constraint(equalToConstant: 50)
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
        
        if let collectionView = movieCollectionView, let searchBar = searchBar {
            view.addSubview(collectionView)
            
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
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
        // If searching, show filtered results. Otherwise, show all movies
        return isSearching ? filteredMovies.count : viewModel.numberOfMovies
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.movieCollectionViewCell, for: indexPath) as? MovieCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // Get the movie from filtered list if searching, otherwise from viewModel
        let movie: MovieModel?
        if isSearching {
            movie = indexPath.item < filteredMovies.count ? filteredMovies[indexPath.item] : nil
        } else {
            movie = viewModel.movie(at: indexPath.item)
        }
        
        guard let movie = movie else {
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
        // Get the movie from filtered list if searching, otherwise from viewModel
        let selectedMovie: MovieModel?
        if isSearching {
            selectedMovie = indexPath.item < filteredMovies.count ? filteredMovies[indexPath.item] : nil
        } else {
            selectedMovie = viewModel.movie(at: indexPath.item)
        }
        
        guard let selectedMovie = selectedMovie else {
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
        
        let rating = String(format: "%.1f", movie.voteAverage ?? 0)

        cell.movieTitleLabel.text = movie.title
        
        cell.movieReleaseLabel.text = "Year: \(movie.releaseDate ?? "Unknown")"
        
        cell.movieScoreLabel.text = "Rating: \(rating)"
        
        let imagePath = Server.ImageBaseUrl.rawValue + (movie.posterPath ?? "")
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
// MARK: - UISearchBarDelegate

extension MovieListVC: UISearchBarDelegate {
    
    /// Called when the user types in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterMovies(with: searchText)
    }
    
    /// Called when the user taps the Search button on the keyboard
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // Dismiss the keyboard
    }
    
    /// Called when the user taps the Cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        filteredMovies = []
        movieCollectionView?.reloadData()
    }
}

// MARK: - Search Logic

private extension MovieListVC {
    
    /// Filters movies based on search text
    func filterMovies(with searchText: String) {
        if searchText.isEmpty {
            // If search text is empty, clear filtered movies
            filteredMovies = []
        } else {
            // Filter movies by title (case-insensitive)
            filteredMovies = []
            
            // Go through all movies from the viewModel
            for index in 0..<viewModel.numberOfMovies {
                if let movie = viewModel.movie(at: index),
                   let title = movie.title,
                   title.lowercased().contains(searchText.lowercased()) {
                    filteredMovies.append(movie)
                }
            }
        }
        
        // Reload collection view to show filtered results
        movieCollectionView?.reloadData()
    }
}

