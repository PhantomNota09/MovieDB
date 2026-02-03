//
//  MovieViewModel.swift
//  MovieDB
//
//  Created by Surya Rayala on 2/3/26.
//

import Foundation

// MARK: - Movie View Model
final class MovieViewModel {
    
    // MARK: - Properties
    
    /// Array of movie models
    private(set) var movies: [MovieModel] = []
    
    /// Computed property for the number of movies
    var numberOfMovies: Int {
        return movies.count
    }
    
    // MARK: - Data Loading
    
    /// Loads movie data from the mock data source
    func loadMovies() {
        movies = generateMockData()
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
    
    // MARK: - Mock Data Generation
    
    /// Generates mock movie data for testing and development purposes
    private func generateMockData() -> [MovieModel] {
        return [
            MovieModel(
                title: "Ad Astra",
                popularityScore: 176.674,
                releaseYear: 2019,
                imageName: "star.fill",
                plotDescription: "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond.",
                rating: 7.9,
                releaseDate: "2019-02-08",
                voteCount: 5000,
                genreId: 878
            ),
            MovieModel(
                title: "Avatar",
                popularityScore: 144.444,
                releaseYear: 2009,
                imageName: "leaf.fill",
                plotDescription: "In the 22nd century, a paraplegic Marine is dispatched to the moon Pandora on a unique mission.",
                rating: 8.0,
                releaseDate: "2009-12-02",
                voteCount: 20000,
                genreId: 878
            ),
            MovieModel(
                title: "The Lion King",
                popularityScore: 123.456,
                releaseYear: 1994,
                imageName: "crown.fill",
                plotDescription: "A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.",
                rating: 8.8,
                releaseDate: "1994-02-11",
                voteCount: 15000,
                genreId: 16
            ),
            MovieModel(
                title: "Inception",
                popularityScore: 198.532,
                releaseYear: 2010,
                imageName: "brain.head.profile",
                plotDescription: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
                rating: 8.8,
                releaseDate: "2010-07-16",
                voteCount: 32000,
                genreId: 878
            ),
            MovieModel(
                title: "The Dark Knight",
                popularityScore: 210.987,
                releaseYear: 2008,
                imageName: "moon.stars.fill",
                plotDescription: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
                rating: 9.0,
                releaseDate: "2008-07-18",
                voteCount: 28000,
                genreId: 28
            )
        ]
    }
}
