//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/3/26.
//

import Foundation

protocol MovieViewModelProtocol: AnyObject {
    var numberOfMovies: Int { get }
    func movie(at index: Int) -> MovieModel?
    func loadMovies() async
}

// MARK: - Movie View Model
class MovieViewModel: MovieViewModelProtocol {

    // MARK: - Properties
    
    /// Array of movie models
    private var movies: [MovieModel] = []
    private var service: NetworkManagerProtocol? = NetworkManager()

    /// Computed property for the number of movies
    var numberOfMovies: Int {
        return movies.count
    }
    
    func numberOfMoviesFunc() -> Int {
        return movies.count
    }
    
    // MARK: - Data Loading
    
    /// Loads movie data from the mock data source
    func loadMovies() async {
        // movies = generateMockData()
        movies = await service?.getDataFromServer(url: Server.MovieDataUrl.rawValue) ?? []
        print("checking this message")

    }

    /// Retrieves a movie at a specific index
    func movie(at index: Int) -> MovieModel? {
        guard index >= 0 && index < movies.count else {
            return nil
        }
        return movies[index]
    }
    
    // MARK: - Formatting Methods
    
    /// Formats a title with prefix
    func formatTitle(_ title: String) -> String {
        return "Title: \(title)"
    }
    
    /// Formats a popularity score
    func formatPopularityScore(_ score: Double) -> String {
        return "Popularity Score: \(score)"
    }
    
    /// Formats a release year
    func formatReleaseYear(_ year: Int) -> String {
        return "Release Year: \(year)"
    }
    
    /// Formats a rating value
    func formatRating(_ rating: Double) -> String {
        return "Rating: \(rating)/10"
    }
    
    /// Formats a release date with prefix
    func formatReleaseDate(_ date: String) -> String {
        return "Release Date: \(date)"
    }
    
    /// Formats vote count with thousands separator
    func formatVoteCount(_ count: Int) -> String {
        return "Vote Count: \(count.formatted())"
    }
    
    /// Formats genre ID for display
    func formatGenreId(_ id: Int) -> String {
        return "Genre ID: \(id)"
    }
}
